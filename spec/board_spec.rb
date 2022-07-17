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

    it 'returns false if the coordinates are not consecutive' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be false
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to be false
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to be false
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to be false
    end

    it 'returnds false when the coordinates are diagaonal' do
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to be false
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to be false
    end

    it 'returns true if the coordinates are valid' do
      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to be true
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to be true
    end
  end

  describe '#place' do
    it 'assigns the coordinates to cells' do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      @cell_1 = @board.cells["A1"]
      @cell_2 = @board.cells["A2"]
      @cell_3 = @board.cells["A3"]

      expect(@cell_1.ship).to eq(@cruiser)
      expect(@cell_2.ship).to eq(@cruiser)
      expect(@cell_3.ship).to eq(@cruiser)
    end

    it 'returns fasle when two ships are overlapping' do
      @board = Board.new(4)
      @cruiser = Ship.new("Cruiser", 3)
      @board.place(@cruiser, ["A1", "A2", "A3"])
      @submarine = Ship.new("Submarine", 2)

      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to be false
    end
  end

  describe 'render' do
    it 'renders a string of letters and numbers' do
      @board.place(@cruiser, ["A1", "A2", "A3"])

      expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
      expect(@borad.render(true).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"))
    end
  end
end
