require 'socket'
require 'thread'
require 'timeout'
require 'innertube'

module Tcpez
  # Error that occurs if the response form is invalid
  class InvalidResponse < RuntimeError; end
  # Connection is the basic connection class that handles reading
  # and writing to a tcpez server over a socket.
  #
  # Much of this code was inspired/taken from https://github.com/aphyr/riemann-ruby-client
  class Connection
    include Timeout

    DEFAULT_ADDRESS = 'localhost:2222'
    DEFAULT_TIMEOUT = 10
    attr_accessor :host, :port, :socket

    attr_accessor :addresses

    def initialize(address = DEFAULT_ADDRESS, timeout = DEFAULT_TIMEOUT)
      @host, @port = address.split(":")
      @timeout = DEFAULT_TIMEOUT
    end

    def connect
      timeout(@timeout) do
        @socket = TCPSocket.new(@host, @port)
      end
    end

    def disconnect
      @socket.close if connected?
    end

    def connected?
      @socket && !@socket.closed?
    end

    # Read a message from a stream
    def read_message(s)
      decode s
    end

    def send_recv(request)
      timeout(@timeout) do
        connect unless connected?
        socket << encode(request)
        read_message @socket
      end
    end

    def encode(s)
      "#{[s.length].pack('l>')}#{s}"
    end

    def decode(s)
      if buffer = s.read(4) and buffer.size == 4
        length = buffer.unpack('l>').first
        s.read length
      else
        raise InvalidResponse, "unexpected EOF"
      end
    end
  end

  # Connection pool uses the innertube gem to manage a threadsafe
  # collection of connections. Client takes an array of addresses
  # that are converted into this connection pool
  class ConnectionPool
    attr_accessor :pool

    RETRYABLE_ERRORS = [
      IOError,
      Errno::EPIPE,
      Errno::ECONNREFUSED,
      Errno::ECONNRESET,
      Timeout::Error,
      Tcpez::InvalidResponse
    ]

    def initialize(addresses = nil)
      addresses ||= [Connection::DEFAULT_ADDRESS]
      @connections = [addresses].flatten.shuffle.map {|a|
        a.is_a?(Connection) ? a : Connection.new(a)
      }
      @pool = Innertube::Pool.new(proc {|a| @connections.sample },
                                  proc {|c| c.disconnect })
      @pool.fill(@connections)
    end

    def size
      @pool.size
    end

    def send_recv(request)
      with_connection do |conn|
        conn.send_recv(request)
      end
    end

    def with_connection
      tries = 0

      @pool.take do |conn|
        begin
          tries += 1
          yield conn
        rescue *RETRYABLE_ERRORS => e
          raise e if tries > 3
          raise Innertube::Pool::BadResource
        end
      end
    rescue Innertube::Pool::BadResource
      retry
    end

  end
end
