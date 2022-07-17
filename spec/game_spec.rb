require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do

  describe 'initialize' do
    it 'exists' do
      game = Game.new

      expect(game).to be_instance_of(Game)
    end
  end

  describe '' do
    it 'places cpu ships' do
      
    end


  end

end
