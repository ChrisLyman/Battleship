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

  describe 'valid coordinate?' do
    it 'returns true if coordinate is valid' do
      expect(@board.valid_coordinate?("A1")).to be true
      expect(@board.valid_coordinate?("D4")).to be true
      expect(@board.valid_coordinate?("A5")).to be false
      expect(@board.valid_coordinate?("E1")).to be false
      expect(@board.valid_coordinate?("A22")).to be false
    end
  end

  describe 'valid placement' do
    it 'returns false when coordinate size is not the same as ship length' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be false
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be false
    end

    it 'returns false if the numbers are not consecutive' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be false
      expect(@board.valid_consecutive_placement?(@submarine, ["A1", "C1"])).to be false
      expect(@board.valid_consecutive_placement?(@cruiser, ["A3", "A2", "A1"])).to be false
      expect(@board.valid_consecutive_placement?(@submarine, ["C1", "B1"])).to be false
    end
  end
end
