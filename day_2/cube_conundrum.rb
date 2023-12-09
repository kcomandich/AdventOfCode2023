require 'pry-byebug'

class CubeConundrum
  def initialize
    @input = IO.read("input.txt").lines
    @games = []
    @valid_games = []
    @min_game_colours = []
    @colours = {'red' => 12, 'green' => 13, 'blue' => 14}
  end

  def find_invalid_games
    @input.each_with_index do |line, i|
      @valid_games << i+1
      @games[i] = line.match(/Game \d+: (.*)/)[1].split(';')

      @games[i].each_with_index do |round, r|
        @colours.keys.each do |c|
          num = @games[i][r].match(/(\d+) #{c}/)
          @valid_games.delete(i+1) if num && num[1].to_i > @colours[c]
        end
      end
    end

    @valid_games.sum
  end

  def find_fewest_colour_count
    @input.each_with_index do |line, i|
      @games[i] = line.match(/Game \d+: (.*)/)[1].split(';')

      @min_game_colours[i] = {}
      @colours.keys.each do |c|
        @min_game_colours[i][c] = 0
      end

      @games[i].each_with_index do |round, r|
        @colours.keys.each do |c|
          num = @games[i][r].match(/(\d+) #{c}/)
          @min_game_colours[i][c] = num[1].to_i if num && num[1].to_i > @min_game_colours[i][c]
        end
      end
    end

    @min_game_colours.map do |g|
      g.values.inject(:*)
    end.sum
  end
end

if $PROGRAM_NAME == __FILE__
  cc = CubeConundrum.new

  puts "Solution"
  puts cc.find_invalid_games
  puts cc.find_fewest_colour_count
end
