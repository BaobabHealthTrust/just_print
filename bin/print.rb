#!/usr/bin/env ruby
#
# Print directly to the printer without going through a CGI server. 
#
# Usage: print.rb </path/to/label.lbl>

printer_host = 'localhost'
log_file     = '/tmp/print_log'

file_path = ARGV[0]

log = File.open(log_file, "a")
log.puts("Started with #{ARGV.join('|')}")

# Label type is file extension - last 3 characters of label file
if file_path.match(/(...)$/)
  type = $1
else
  type = "lbl"
end 
log.puts "Label Type: #{type}"
label = true
# Get the port from the label's extension
if type == 'lbs'
  port = '4243'
elsif type == 'pdf'
  label = false
else
  port = '4242'
end

# Send label to printer
print_cmd = ''
if label
 print_cmd = "cat #{file_path} | netcat -q 1 #{printer_host} #{port}"
else
  print_cmd = "lp #{file_path}"
end

log.puts print_cmd
`#{print_cmd}`

log.puts "Finished!"
exit
