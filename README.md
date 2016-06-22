# Description

This program parses the configuration file into a Hash using only the ruby standard library (no gems used).

Hash values will use the appropriate native Ruby data types. 
For example `debug_mode=off` would return in the hash,  'debug_mode: false'


Given a file with the following contents:

host = test.com

server_id=55331

server_load_alarm=2.5

user= user

verbose =true

test_mode = on

debug_mode = off

log_file_path = /tmp/logfile.log

send_notifications = yes

 

## Command to run the program

ruby project.rb --filename config.txt