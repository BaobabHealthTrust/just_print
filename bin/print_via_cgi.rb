#!/usr/bin/env ruby
# The print_string is the actual command to be sent to the printer
# Because the iopener web server can only accept GETs of limited size
# We have to send multiple GETs and tell the iopener when we are done
 
destination = "127.0.0.1"
log = File.open("/tmp/print_log", "a")
log.puts("Started with #{ARGV.join('|')}")
 
#if ARGV[1].nil?
#  if ENV["DISPLAY"].nil?
#    log.puts "No destination or DISPLAY set"
#    exit
#  end
#  destination = ENV["DISPLAY"].split(":").first unless ENV["DISPLAY"].nil?
#else
#  destination = ARGV[1]
#end
 
log.puts destination
 
port = "80"
url = "http://#{destination}:#{port}/cgi-bin/print"
#wget_command = "wget -q --output-document=/dev/null"
wget_command = "wget --output-document=/dev/null"
 
file = File.open(ARGV[0])
whole_string = file.read
 
 
index=0
max_length = 60
sent_string = ""
commands = ""

# Label type is file extension - last 3 characters of label file
if file.path.match(/\.(...)$/)
  type = $1
else
  type = "lbl"
end 
log.puts "Label Type: #{type}"

while true
  end_point = index + max_length
  current_slice = whole_string[index..end_point]
  end_of_string = end_point > whole_string.length
  if end_of_string
    mode = "finish"
  elsif index == 0
    mode = "start"
  else
    mode = "continue"
  end
 
 
# Stupid hack to fix lines ending with newlines which don't seem to get handled right on the popper
  current_slice = current_slice + " " if current_slice.match(/\n$/)
  current_slice.gsub!('"', '\"') if current_slice
  command = "#{wget_command} \"#{url}?mode=#{mode}&print_string=#{current_slice}&type=#{type}\""
# puts command
  commands << command + "\n"
# puts command
# puts `#{command}`
`#{command}`
 
  sent_string << current_slice
 
  break if end_of_string
  index+=max_length+1
end
 
log.puts sent_string
log.puts commands
log.puts "Finished!"
 
exit
