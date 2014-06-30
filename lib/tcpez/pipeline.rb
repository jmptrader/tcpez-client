require 'tcpez/connection'

module Tcpez
  # Pipeline wraps a Tcpez::Connection to provide a simple interface for
  # sending pipelined requests. The Tcpez Protocol allows for multiple
  # requests and responses to be pipelined in a single batch.
  class Pipeline
    attr_reader :connection,
                :buffer,
                :count

    # Initialize with a Tcpez::Connection
    def initialize(connection)
      @connection = connection
      @buffer = ''
      @count  = 0
    end

    # send_request buffers all the requests into an in memory
    # buffer object and are only sent when `flush` is called.
    def send_request(request)
      buffer << connection.encode(request)
      @count += 1
    end

    # Flush sends all buffered requests as a single request and blocks
    # waiting for the response to each request in the order that they
    # were sent.
    def flush
      # encode the buffer
      message = "#{[-count].pack('l>')}#{buffer}"
      # send the whole buffer
      connection.socket << message
      # read the response header
      header = connection.socket.read 4
      if header.size != 4
        raise Tcpez::InvalidResponse, "Expected pipeline header but was #{header}"
      end
      response_count = header.unpack('l>').first
      if response_count != -count
        raise Tcpez::InvalidResponse, "Expected pipeline to return #{count} messages but got #{-response_count}"
      end
      # itterate over responses and decode
      responses = []
      count.times do |i|
        responses << connection.decode(connection.socket)
      end
      responses
    end

  end
end
