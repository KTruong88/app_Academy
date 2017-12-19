require_relative 'Board.rb'
require_relative 'Card.rb'
require_relative 'HumanPlayer.rb'
require_relative 'ComputerPlayer.rb'
require 'byebug'

class Game

  def initialize(player)
    @board = Board.new
    @board.populate
    @player = player
  end

  def make_guess(pos)
    @board.reveal(pos)
  end

  def check_match(pos1, pos2)
    if @board[pos1].match(@board[pos2])
      puts 'Match!'
      @player.match_locations.delete(pos1)
      @player.match_locations.delete(pos2)
    else
      puts 'No Match!'
      @board[pos1].hide
      @board[pos2].hide
    end
  end

  def play_game
    until @board.won?
      @player.look_for_match
      system("clear")
      @board.render
      pos = @player.get_guess
      make_guess(pos)
      @player.get_card(pos, @board[pos].face_value)
      system("clear")
      @board.render
      pos2 = @player.get_guess
      make_guess(pos2)
      @player.get_card(pos2, @board[pos2].face_value)
      system("clear")
      @board.render
      sleep 1
      check_match(pos, pos2)
      sleep 1
    end
    print "You win #{@player.name}!!"
  end


end

if __FILE__ == $PROGRAM_NAME
  puts "name?"
  name = gets.chomp
  player = ComputerPlayer.new(name)
  game = Game.new(player)
  game.play_game
end
