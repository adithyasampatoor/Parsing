require 'optparse'
require 'ostruct'

options = OpenStruct.new
OptionParser.new do |opt|
  opt.on('--filename Word-list-filename') {|o| options.filename = o}
end.parse!

class FileParse
  # initialize the data of configuration
  def initialize
    # main data
    @data = [] 
    # result
    @result = []
  end

  attr_accessor :data
  attr_accessor :result

  # read the work list from given filename
  def read filename
    File.open(filename, "r") do |f|
      f.each_line do |line|
      	 string = line.to_s.chomp
         next if string.start_with?("#")

         parse(string)
      end
    end
  end
  
  # parse line
  def parse string
    key, value = string.split("=")

	  value = "true" if value.to_s.strip == "on" or value.to_s.strip == "yes" 
	  value = "false" if value.to_s.strip == "off" or value.to_s.strip == "no"

	  puts "key: #{key}"
	  puts "value: #{value}"
    @result << { "#{key.to_s.strip}" => "#{value.to_s.strip}" }
  end

  # Get hash result
  def getResult
    @result
  end
  
end

g = FileParse.new
g.read options.filename
puts g.getResult
