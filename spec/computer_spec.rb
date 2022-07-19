require './lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/computer'

RSpec.describe Computer do
  before do
    @computer = Computer.new
  end

  describe 'initialize' do
    it 'exists' do
      expect(@computer).to be_instance_of(Computer)
    end
  end

  describe 'initialize' do
    it 'initializes an instance of board' do
      expect(@computer.cpu_board).to be_instance_of(Board)
    end
  end

    it 'has the ships on the board' do
      ship = Ship.new("Cruiser", 3)
      @computer.generate_random_coordinates(ship, true)
      allow(@computer).to receive(:generate_random_coordinates).and_return(["B2", "B3", "B4"], ["A1", "B1"])
      @computer.place_cpu_cruiser
      @computer.place_cpu_submarine
      expect(@computer.cpu_board.render(true)).to eq("  1 2 3 4 \nA S . . . \nB S S S S \nC . . . . \nD . . . . \n")
    end
end
