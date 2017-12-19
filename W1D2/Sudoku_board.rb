require_relative 'Tile.rb'
require 'colorize'

class Board

  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def self.from_file(file)
    grid = Array.new(9){ Array.new(9) }
    array = File.readlines(file).map(&:chomp)
    array.each_with_index do |line, idx|
      line = line.to_s.split("")
      line.each_with_index do |number, idx2|
        if number == 0.to_s
          grid[idx][idx2] = Tile.new(0, false)
        else
          grid[idx][idx2] = Tile.new(number.to_i, true)
        end
      end
    end
    return Board.new(grid)
  end

  def render
    str = ''
    @grid.each do |line|
      line.each do |el|
        str << "#{el.to_s} "
      end
      str << "\n"
    end
    print str
  end

end

x = Board.from_file("puzzle.txt")
x.render
