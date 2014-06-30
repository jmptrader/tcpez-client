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

end
