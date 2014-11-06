require 'tcpez/connection'

module Tcpez
  # Client wraps a tcpez connection pool with as a client object.
  # Real client libraries should descend from `Tcpez::Client`
  class Client

    attr_reader :pool

    # Takes an array of addresses to initialize the connection pool
    def initialize(addresses = nil)
      @pool = ConnectionPool.new(addresses)
    end

    # Send a request and get a response.
    def send_recv(request)
      pool.send_recv(request)
    end
   
    # Close all the connections in the pool
    def disconnect
      @pool.disconnect
    end
    alias :close :disconnect

  end
end
