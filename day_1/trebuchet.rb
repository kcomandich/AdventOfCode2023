require 'pry-byebug'

class Trebuchet

  def initialize
     @input = IO.read("input.txt").split("\n")
  end
end

if $PROGRAM_NAME == __FILE__
  t = Trebuchet.new

  puts "Solution"
end
