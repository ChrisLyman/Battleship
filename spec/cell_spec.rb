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

  describe '#fired_upon?' do
    it 'knows if its been fired upon' do
      @cell.place_ship(@cruiser)

      expect(@cell.fired_upon?).to be false

      @cell.fire_upon

      expect(@cell.fired_upon?).to be true
      expect(@cell.ship.health).to eq(2)
    end
  end

  describe '#render' do
    before do
      @cell_1 = Cell.new("B4")
      @cell_2 = Cell.new("C3")
    end

    it 'returns "." as a default' do
      expect(@cell_1.render).to eq(".")
    end

    it 'returns "M" when there is a miss' do
      @cell_1.fire_upon
      expect(@cell_1.render).to eq("M")
    end

    it 'returns "S" when the ship is placed' do
      @cell_2.place_ship(@cruiser)
      expect(@cell_2.render(true)).to eq("S")
    end

    it 'returns "H" when damaged' do
      @cell_2.place_ship(@cruiser)
      @cell_2.fire_upon
      expect(@cell_2.render).to eq("H")
    end

    it 'returns "X" when sunk' do
      @cell_2.place_ship(@cruiser)
      @cell_2.fire_upon
      @cruiser.hit
      @cruiser.hit

      expect(@cell_2.render).to eq("X")
      expect(@cruiser.sunk?).to be true
    end
  end
end
