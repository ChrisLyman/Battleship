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
end
