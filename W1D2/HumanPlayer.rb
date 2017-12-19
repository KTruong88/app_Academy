class HumanPlayer

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_guess
    loop do
      puts "Pick a card (row,column): "
      pos = gets.chomp.split(",").map(&:to_i)
      if valid_guess?(pos)
        return pos
      else
        puts "Invalid input. Try again."
      end
    end
  end

  def valid_guess?(guess)
    if guess.length == 2 && guess.all? { |value| (0..5).include?(value)}
      return true
    else
      false
    end
  end

  def get_card(pos, value)
  end

end
