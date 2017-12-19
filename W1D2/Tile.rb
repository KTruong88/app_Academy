class Tile

  attr_accessor :value, :given

  def initialize(value, given)
    @value = value
    @given = given
  end

  def to_s
    if @value == 0
      ' '
    else
      @value.to_s
    end
  end


end
