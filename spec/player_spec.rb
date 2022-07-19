require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'

RSpec.describe Player do
  before do
    @player = Player.new
  end

  describe 'initialize' do
    it 'exists' do
      expect(@player).to be_instance_of(Player)
    end
  end

  



end
