require 'pry-byebug'

class Trebuchet
  attr_accessor :digits

  def initialize
     @input = IO.read("input.txt").split("\n")
     @digits = []
  end

  def extract_digits
     @input.each do |i|
       @digits.push("#{i.match(/\d/)[0]}#{i.reverse.match(/\d/)[0]}".to_i)
     end
  end
end

if $PROGRAM_NAME == __FILE__
  t = Trebuchet.new

  t.extract_digits

  puts "Solution: #{t.digits.sum}"
end
