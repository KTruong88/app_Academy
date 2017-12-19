require_relative 'Card.rb'
require 'byebug'
class Board

  attr_reader :grid


  def initialize
    @grid = Array.new(6) { Array.new(6) }
    @values = ["A", "2", "3", "4", "5", "6", "7",
              "8", "9", "T", "J", "Q", "K", "A",
              "2", "3", "4", "5", "6", "7",
              "8", "9", "T", "J", "Q", "K"]
  end

  def [](pos)
    row, column = pos
    @grid[row][column]
  end

  def []=(pos, val)
    row, column = pos
    @grid[row][column] = val
  end

  def place_card(card)
    x = rand(0..5)
    y = rand(0..5)
    if self[[x, y]] == nil
      self[[x, y]] = card
    else
      place_card(card)
    end
  end

  def populate
    18.times do |value|
      face = @values.shuffle.pop
      card = Card.new(face)
      card2 = Card.new(face)
      place_card(card)
      place_card(card2)
    end
  end

  def render
    string = "  0 1 2 3 4 5\n"
    counter = 0
    row_counter = 0
    string << "#{row_counter} "
    @grid.each do |row|
      row.each do |el|
        string << el.to_s
        string << ' '
        counter += 1
        if counter % 6 == 0
          string << "\n"
          row_counter += 1
          string << "#{row_counter} " unless row_counter == 6
        end
      end
    end
    print string
  end

  def won?
    counter = 0
    @grid.each do |row|
      if row.all? { |el| el.face_down == false }
        counter += 1
      end
    end
    if counter == 6
      return true
    end
    false
  end

  def reveal(guessed_pos)
    self[guessed_pos].reveal
    self[guessed_pos].face_value
  end

  def hide(guessed_pos)
    self[guessed_pos].hide
  end

end
