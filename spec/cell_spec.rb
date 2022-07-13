require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before do
      @cell = Cell.new("B4")
      @cruiser = Ship.new("Cruiser", 3)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@cell).to be_instance_of(Cell)
    end
  end

  describe '@coordinate' do
    it 'has a coordinate' do
      expect(@cell.coordinate).to eq("B4")
    end
  end

  describe '@ship' do
    it 'has a default value of nil' do
      expect(@cell.ship).to be nil
    end
  end

  describe '#empty' do
    it 'returns true if cell does not contain a ship' do
      expect(@cell.empty?).to be true
    end
  end

  describe '#place_ship' do
    it 'can place a ship' do
      @cell.place_ship(@cruiser)

      expect(@cell.ship).to eq(@cruiser)
      expect(@cell.empty?).to be false
    end
  end
end
