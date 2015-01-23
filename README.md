# tcpez-client

tcpez-client is a basic ruby client for the tcpez protocol. 

## What

tcpez-client provides the basic building blocks for implementing a Ruby client for a server that speaks the tcpez protocol.

For more information about tcpez and the tcpez protocol see: https://github.com/paperlesspost/tcpez

## Usage

Subclass the Tcpez::Client class to create a fully featured client:

```ruby
class MyClient < Tcpez::Client
  
  def ping
    send_recv "PING"
  end

end

c = MyClient.new(["localhost:2222"]) # pool of tcpez servers
c.ping #=> "PONG"
```

## Specifically

* A Tcpez::ConnectionPool, that uses inntertube to give threadsafe connection pooling across as many servers as you want
* A Tcpez::Pipeline for performing simple pipelined requests
* A Tcpez::Client, that you can subclass to define your own client API. You just need to `send_recv`

## About

tcpez was created by Aaron Quint (quirkey) at Paperless Post (http://www.paperlesspost.com) and is licensed under the MIT license.


