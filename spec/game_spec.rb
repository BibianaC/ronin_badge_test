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

  it 'should have max two players' do
    game.add!(player)
    game.add!(player)
    expect(lambda{ game.add!(player) }).to raise_error(RuntimeError, 'Only two players are allowed')
  end

  it 'should accept rock as a valid choice' do
    expect(game.is_valid?('rock')).to eq(true)
  end

  it 'should accept paper as a valid choice' do
    expect(game.is_valid?('paper')).to eq(true)
  end

  it 'should accept scissors as a valid choice' do
    expect(game.is_valid?('scissors')).to eq(true)
  end

  it 'should raise an error if the choice is not valid' do
    expect(lambda{ game.is_valid?('banana') }).to raise_error(RuntimeError, 'Not a valid option')
  end

end