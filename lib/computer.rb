class Computer

  attr_reader :cpu_ships, :cpu_board
  def initialize
    @cpu_ships = cpu_ships
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @cpu_board = Board.new(4)


  end

  def generate_random_coordinates(ship, vertical = false)

  # vertical is up and down if its true and left and right if its false
    potential_coordinates = []
    # coordinates = vertical ? @cpu_board.cells.keys: cpu_board.vertical_coordinates
    coordinates = if vertical
      @cpu_board.cells.keys # returns computer board as keys(reaching through)
    else
      @cpu_board.vertical_coordinates #returns vertical coordinates
    end
    until cpu_board.valid_placement?(ship, potential_coordinates) do #returns true
      potential_coordinates = coordinates.slice(rand(coordinates.length), ship.length)
      #randomizes valid coordinates
    end
  end

  def place_cpu_cruiser
    @cpu_board.place(@cruiser, generate_random_coordinates(@cruiser, [true, false].sample))
    #returns random coordinates equal to length of ship listed
  end

  def place_cpu_submarine
    @cpu_board.place(@submarine, generate_random_coordinates(@submarine, [true, false].sample))
      #returns random coordinates equal to length of ship listed 
  end


end
