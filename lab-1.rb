require 'socket'

class String
  def string_between_markers marker1, marker2
    self[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
  end
end

message = "hello"

socket = TCPSocket.new 'localhost', 8000
socket.puts "GET /distributed-sytems-lab-1.php?message=#{message} HTTP/1.0\r\n\r\n"
response = socket.recv(1000)

capitalised_message = response.string_between_markers "\r\n\r\n", "\\n"

puts "The server recieved our message '#{message}' and returned '#{capitalised_message}'"