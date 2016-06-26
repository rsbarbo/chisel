require 'pry'
require_relative "file_reader"
require_relative "chisel_file"
require_relative "formatter"

input   = FileReader.read(ARGV[0])
file    = ChiselFile.new
html =  file.parser(input)
File.write(ARGV[1], html)
