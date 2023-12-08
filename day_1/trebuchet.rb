require 'pry-byebug'

class Trebuchet
  attr_accessor :digits

  def initialize
     @input = IO.read("input.txt").split("\n")
     @digits = []
     @words = %w(zero one two three four five six seven eight nine)
  end

  def extract_digits
     @input.each do |i|
       @digits.push("#{first_digit(i)}#{last_digit(i)}".to_i)
     end
  end

  private

  def all_digits(string)
    # use (?=pat) so that overlapping words are all captured
    # for example "three28jxdmlqfmc619eightwol" => ["three", "2", "8", "6", "1", "9", "eight", "two"]
    # instead of => ["three", "2", "8", "6", "1", "9", "eight"]
    # Positive lookahead assertion: ensures that the following characters match pat,
    # but doesn’t include those characters in the matched text
    # https://ruby-doc.org/3.2.2/Regexp.html
    string.scan(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/).flatten
  end

  def first_digit(string)
    num = all_digits(string)[0]

    return @words.index(num) ?  @words.index(num) : num
  end

  def last_digit(string)
    num = all_digits(string)[-1]

    return @words.index(num) ?  @words.index(num) : num
  end
end

if $PROGRAM_NAME == __FILE__
  t = Trebuchet.new

  t.extract_digits

  puts "Solution: #{t.digits.sum}"
end
