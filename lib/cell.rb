class Cell

  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(boat)
    @ship = boat
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @ship != nil
      @ship.hit
    end
  end

  def shot_miss
    if fired_upon? && empty?
      true
    end
  end

  def ship_destroyed
    if fired_upon? && @ship.sunk?
      true
    end
  end


  def ship_damaged
    if fired_upon? && !empty?
      true
    end
  end

  def render(user = false)
    if !fired_upon? && !empty? && user == true
      "S"
    elsif shot_miss
      "M"
    elsif ship_destroyed
      "X"
    elsif ship_damaged
      "H"
    else
      "."
    end
  end
end
