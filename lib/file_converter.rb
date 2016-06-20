require "pry"
require_relative "file_reader"
require_relative "chisel"

  input   = FileReader.read(ARGV[0])
  file    = Chisel.new
  braille = file.HERE YOU WILL ADD THE METHOD THAT TRANSLATE TO HTML(input)
            File.write(ARGV[1], html)
