require './lib/ship'

RSpec .describe Ship do
  before do
    @ship = Ship.new("Cruiser", 3)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@ship).to be_instance_of(Ship)
    end
  end

  describe '@name' do
    it 'should have a name' do
      expect(@ship.name).to eq("Cruiser")
    end
  end

  describe 'length' do
    it 'should have a length' do
      expect(@ship.length).to eq(3)
    end
  end

  describe 'health' do
    it 'should have health equal to length' do
      expect(@ship.health).to eq(@ship.length)
    end
  end
end
