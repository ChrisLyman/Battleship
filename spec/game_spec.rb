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

  describe 'place cpu ships' do
    it 'places computers ships' do


        expect(ship.placement).to eq(random_array) #my thought process here
    end
  end
end
#another thought: creating separate classes for player and computer?
#seems like it might be easier to separate them out, vs forcing them to work so hard together?
#lmk your thoughts, we have plenty of project work time during the week.
#see ya! 
