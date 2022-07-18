class Game
  def initialize
    @board_size = nil
  end

  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    play_or_quit = gets.chomp.downcase
    if play_or_quit = p
      puts "Please enter the board size"
      @board_size = gets.chomp
      @cpu_board = Board.new(@board_size)
    end
  end

end
