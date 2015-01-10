require 'game'

describe Game do
	let(:game) {Game.new}
  let(:player) {Player.new('Bibiana')}

  it 'should not have players when initialize' do
    expect(game.players).to be_empty
  end

  it 'should be able to add players' do
    game.add!(player)
    expect(game.players).not_to be_empty
  end
end