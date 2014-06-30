# tcpez-client

tcpez-client is a basic ruby client for the tcpez protocol. 

## What

tcpez-client provides the basic building blocks for implementing a Ruby client for a server that speaks the tcpez protocol.

For more information about tcpez and the tcpez protocol see: https://github.com/paperlesspost/tcpez

## Specifically

* A Tcpez::ConnectionPool, that uses inntertube to give threadsafe connection pooling across as many servers as you want
* A Tcpez::Pipeline for performing simple pipelined requests
* A Tcpez::Client, that you can subclass to define your own client API. You just need to `send_recv`

## Contributing to tcpez-client
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2014 Aaron Quint, Paperless, Inc. See LICENSE.txt for
further details.

