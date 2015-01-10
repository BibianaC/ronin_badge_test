require 'game'

describe Game do
	let(:game) {Game.new}

  it 'should not have players when initialize' do
    expect(game.player).to eq(false)
  end
end