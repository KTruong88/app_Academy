class ComputerPlayer

  attr_reader :name
  attr_accessor :match_locations

  def initialize(name)
    @name = name
    @memory = Hash.new(nil)
    @match_locations = []
  end

  def get_guess
    if @match_locations.length > 0
      #byebug
      @match_locations.shift
    else
      arr = []
      arr << rand(0..5)
      arr << rand(0..5)
      return arr
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
    @memory[pos] = value
  end

  def look_for_match
    counter_hash = Hash.new(0)
    @memory.each { |k, v| counter_hash[v] += 1 }
    matched_value = nil
    counter_hash.each { |k, c| matched_value = k if c == 2 }
    if matched_value
      @memory.each { |k, v| @match_locations << k.dup if v == matched_value }
      @memory.reject! { |k| @match_locations.include?(k) }
    end
  end

end
