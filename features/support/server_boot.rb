require_relative 'mock_server'
require 'net/http'

SERVER_PORT    = 4589
MOCK_SERVER_URL = "http://127.0.0.1:#{SERVER_PORT}".freeze

# Boot the mock WEBrick server in a background thread
Thread.new do
  server = WEBrick::HTTPServer.new(
    Port:       SERVER_PORT,
    BindAddress: '127.0.0.1',
    Logger:     WEBrick::Log.new('/dev/null'),
    AccessLog:  []
  )
  server.mount('/', MockSaucedemo::AppServlet)
  server.start
end

# Wait until the server is accepting connections (max 10 s)
started = false
10.times do
  begin
    Net::HTTP.get(URI("#{MOCK_SERVER_URL}/"))
    started = true
    break
  rescue Errno::ECONNREFUSED
    sleep 1
  end
end

raise "Mock server did not start on port #{SERVER_PORT}" unless started

puts "Mock server ready at #{MOCK_SERVER_URL}"
