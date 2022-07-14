require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
  before do
    @board = Board.new(4)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  describe 'initialize' do
    it 'exists' do
      expect(@board).to be_instance_of(Board)
    end
  end

  describe 'size' do
    it 'the board has a size' do
      expect(@board.size).to eq(4)
    end
  end

  describe 'create cells' do
    it 'contains the cells within the board' do
      expect(@board.create_cells.size).to eq(16)
    end

  end

end
