require './lib/ship'
require './lib/cell'
require './lib/board'




class Game
  attr_reader  :cpu_board, :player

  def initialize
    # @board_size = 4
    @cpu_cruiser = Ship.new("Cruiser", 3)
    @cpu_submarine = Ship.new("Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)

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
      turn(cpu_board, player_board)
    end
  end

  def generate_random_coordinates(ship, vertical = false, cpu_board)
  # vertical is up and down if its true and left and right if its false
    potential_coordinates = []
    # coordinates = vertical ? cpu_board.cells.keys: cpu_board.vertical_coordinates
   if vertical
      cpu_board.cells.keys # returns computer board as keys(reaching through)
    else
      cpu_board.vertical_coordinates #returns vertical coordinates
    end
    until cpu_board.valid_placement?(ship, potential_coordinates) do #returns true
      potential_coordinates = coordinates.slice(rand(coordinates.length), ship.length)
      #randomizes valid coordinates
    end
    potential_coordinates 

  end

  def place_cpu_cruiser(cpu_board)
    cpu_board.place(@cpu_cruiser, generate_random_coordinates(@cpu_cruiser, [true, false].sample, cpu_board))
    #returns random coordinates equal to length of ship listed
  end

  def place_cpu_submarine(cpu_board)
    cpu_board.place(@cpu_submarine, generate_random_coordinates(@cpu_submarine, [true, false].sample, cpu_board))
      #returns random coordinates equal to length of ship listed
  end


  def place_player_cruiser(player_board)
    puts "place your cruiser! it is 3 coordinates long."
    coordinates = gets.chomp.upcase.split(" ")
    if player_board.valid_placement?(@player_cruiser, coordinates)
      player_board.place(@player_cruiser, coordinates)

    else
      puts "Invalid Coordinates"
      place_player_cruiser(player_board)
    end
  end

  def place_player_submarine(player_board)
    puts 'place your submarine! it is 2 coordinates long.'
    coordinates = gets.chomp.upcase.split(" ")
    if player_board.valid_placement?(@player_submarine, coordinates)
      player_board.place(@player_submarine, coordinates)

    else
      puts "Invalid Coordinates"
      place_player_submarine(player_board)

    end

  end

  def turn(cpu_board, player_board)
    puts "===================== computer board ====================="
    puts cpu_board.render(show = true)
    puts "===================== player board ====================="
    puts player_board.render(show = true)
    player_shot(cpu_board)
    cpu_shot(player_board)
      if @player_cruiser.sunk? && @player_submarine.sunk?
        puts "The computer won!"
      elsif @cpu_cruiser.sunk? && @cpu_submarine.sunk?
        puts "You win!"
      else
        turn(cpu_board, player_board)
      end
  end

  def player_shot(cpu_board)
    puts "Select opponents cell to shoot"
      player_shot = gets.chomp.upcase
      until cpu_board.valid_coordinate?(player_shot) && !cpu_board.cells[player_shot].fired_upon?
          puts "Please enter a valid coordinate."
          player_shot = gets.chomp.upcase
      end
    player_cell = cpu_board.cells[player_shot]
    player_cell.fire_upon
    render_shots(player_shot, player_cell, ["Your", "my"])
  end


  def render_shots(shot, cell, pro_noun)
    if cell.render == "X"
      puts "#{pro_noun[0]} shot on #{shot} sunk #{pro_noun[1]} ship"
    elsif cell.render == "H"
      puts "#{pro_noun[0]} shot on #{shot} was a hit"
    elsif cell.render == "M"
      puts "#{pro_noun[0]} shot on #{shot} was a miss"
    end
  end

  def cpu_shot(player_board)
      cpu_shot = player_board.cells.keys.sample(1).join
        until !player_board.cells[cpu_shot].fired_upon?
          cpu_shot = player_board.cells.keys.sample(1).join
        end
      cpu_cell = player_board.cells[cpu_shot]
      cpu_cell.fire_upon
      render_shots(cpu_shot, cpu_cell, ["My", "your"])
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
