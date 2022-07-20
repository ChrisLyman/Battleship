require './lib/ship'
require './lib/cell'
require './lib/board'




class Game
  attr_reader  :cpu_board, :player

  def initialize
    # @board_size = 4
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)

  end

  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    play_or_quit = gets.chomp.downcase
    if play_or_quit == "p"
      puts "Please enter the board size"
      @board_size = gets.chomp
      cpu_board = Board.new(@board_size)
      player_board = Board.new(@board_size)

      place_cpu_cruiser(cpu_board)
      place_cpu_submarine(cpu_board)
      place_player_cruiser(player_board)
      place_player_submarine(player_board)
    end
  end

  def generate_random_coordinates(ship, vertical = false, cpu_board)
  # vertical is up and down if its true and left and right if its false
    potential_coordinates = []
    # coordinates = vertical ? cpu_board.cells.keys: cpu_board.vertical_coordinates
    coordinates = if vertical
      cpu_board.cells.keys # returns computer board as keys(reaching through)
    else
      cpu_board.vertical_coordinates #returns vertical coordinates
    end
    until cpu_board.valid_placement?(ship, potential_coordinates) do #returns true
      potential_coordinates = coordinates.slice(rand(coordinates.length), ship.length)
      #randomizes valid coordinates
    end
    coordinates
  end

  def place_cpu_cruiser(cpu_board)
    cpu_board.place(@cruiser, generate_random_coordinates(@cruiser, [true, false].sample, cpu_board))
    #returns random coordinates equal to length of ship listed
  end

  def place_cpu_submarine(cpu_board)
    cpu_board.place(@submarine, generate_random_coordinates(@submarine, [true, false].sample, cpu_board))
      #returns random coordinates equal to length of ship listed
  end


  def place_player_cruiser(player_board)
    puts "place your cruiser! it is 3 coordinates long."
    coordinates = gets.chomp.upcase.split(" ")
    if player_board.valid_placement?(@cruiser, coordinates)
      player_board.place(@cruiser, coordinates)

    else
      puts "Invalid Coordinates"
      place_player_cruiser(player_board)
    end
  end

  def place_player_submarine(player_board)
    puts 'place your submarine! it is 2 coordinates long.'
    coordinates = gets.chomp.upcase.split(" ")
    if player_board.valid_placement?(@submarine, coordinates)
      player_board.place(@submarine, coordinates)

    else
      puts "Invalid Coordinates"
      place_player_submarine(player_board)

    end

  end

end
Game.new.start
#   end
# methods:
#   board
#   place_cpu_ships
#     -board -cruiser, sub -coordinates
#   place players ships
#   taking turns
#     cpu shot
#       check cpu win
#     player shot
#       check player win
#     end of game
# end
