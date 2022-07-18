require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do
  before do
    @game = Game.new
  end

    describe 'initialize' do
      it 'exists' do

        expect(game).to be_instance_of(Game)
      end
    end

    describe 'start' do
      it 'puts out two start messages' do

        expect(@game.start).to eq("Welcome to BATTLESHIP")
      end
    end
end
#another thought: creating separate classes for player and computer?
#seems like it might be easier to separate them out, vs forcing them to work so hard together?
#lmk your thoughts, we have plenty of project work time during the week.
#see ya!
