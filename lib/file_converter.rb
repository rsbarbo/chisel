require 'pry'
require_relative "file_reader"
require_relative "chisel_file"

  input   = FileReader.read(ARGV[0])
  file    = ChiselFile.new
  html = file.something(input)
            File.write(ARGV[1], html)
