require 'helper'

class TestTcpez < MiniTest::Spec

  describe "Tcpez::Connection" do
    before do
      @connection = Tcpez::Connection.new
    end
    it "initializes with defaults" do
      assert @connection
      assert_equal '2222', @connection.port
      assert_equal 'localhost', @connection.host
    end
  end

  describe "Tcpez::ConnectionPool" do
    before do
      @pool = Tcpez::ConnectionPool.new(["localhost:2222", "localhost:2223", "localhost:2234"])
    end
    it "should fill the pool with connections" do
      assert_equal 3, @pool.size
    end
  end
  
  describe "Tcpez::ConnectionPool" do
    before do
      @pool = Tcpez::ConnectionPool.new(["localhost:3222", "localhost:3223", "localhost:2234"])
    end

    it "should eventually time out bad connections and raise an error" do
      assert_raises Errno::ECONNREFUSED do
        @pool.send_recv "ping"
      end
    end
  end

end
