require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  before do
    @game = Game.new
  end

    describe 'initialize' do
      it 'exists' do
        expect(@game).to be_instance_of(Game)
      end
    end

    describe 'start' do
      it 'puts out two start messages' do
        expect(@game.start).to eq("Welcome to BATTLESHIP")
      end
    end

      it 'has the ships on the board' do
         ship = Ship.new("Cruiser", 3)
         allow(@game).to receive(:generate_random_coordinates).and_return(["B2", "B3", "B4"], ["A1", "B1"])
         @game.place_cpu_cruiser
         @game.place_cpu_submarine

         expect(@game.cpu_board.render(true)).to eq("  1 2 3 4 \nA S . . . \nB S S S S \nC . . . . \nD . . . . \n")
       end

       
end
