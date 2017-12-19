class Card

  attr_reader :face_value, :face_down

  def initialize(face_value)
    @face_value = face_value
    @face_down = true
  end

  def reveal
    @face_down = false
  end

  def hide
    @face_down = true
  end

  def to_s
    if @face_down
      "?"
    else
      @face_value.to_s
    end
  end

  def match(card)
    @face_value == card.face_value
  end

end
