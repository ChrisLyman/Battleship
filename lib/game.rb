class Game
  def initialize
    @board_size = nil
    @cpu_ships = generate_cpu_ships
  end

  def start
    puts "Welcome to BATTLESHIP \n"
    puts "Enter p to play. Enter q to quit."
    play_or_quit = gets.chomp.downcase
    if play_or_quit == "p"
      puts "Please enter the board size you want."
      @board_size = gets.chomp.to_i
      @cpu_board = Board.new(@board_size)
      place_cpu_ships(@cpu_board)
      place_players_ships
      puts "Preparing Board"
      turn

    elsif play_or_quit == "q"
      puts "Have a good day!"

    else
       puts "Invalid Choice"
      start
    end








  # def place_cpu_ships(board)
  #   @cpu_ships.each do |ship|
  #     coordinates = valid_cpu_coordinates(board, ship)
  #     board.place(ship, coordinates)
  #   end
  # end
  #
  # def generate_cpu_ships
  #   ships == [["Battleship", 4], ["Cruiser", 3], ["Submarine", 2]["Destroyer", 2]]
  #   ships.shuffle.take(2).map do |ship|
  #     Ship.new(ship[0],ship[1])
  #   end
  # end
end
end




# require 'pry'; binding.pry
