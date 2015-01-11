require 'game'

describe Game do
	let(:game) {Game.new}
  let(:player) {Player.new('Bibiana')}
  let(:player2) {Player.new('Serafeim')}

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
    expect(lambda { game.add!(player) }).to raise_error(RuntimeError, 'Only two players are allowed')
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
    expect(game.is_valid?('banana')).to eq(false)
  end

  it 'should raise an error if the choice is added for a player that is not in the game' do
    player_test = Player.new('Bibiana')
    expect(lambda { game.choose(player_test, 'rock') }).to raise_error(RuntimeError, "The player #{player.name} is not part of the game")
  end

  it 'should say it is a draw if the two players have the same choice' do
    game.add!(player)
    game.choose(player, 'rock')
    game.add!(player2)
    game.choose(player2, 'rock')
    expect(game.result).to eq('It\'s a draw')
  end

  it 'rock defeats scissors' do
    game.add!(player)
    game.choose(player, 'rock')
    game.add!(player2)
    game.choose(player2, 'scissors')
    expect(game.result).to eq("#{player.name} wins")
  end

  it 'paper defeats rock' do
    game.add!(player)
    game.choose(player, 'rock')
    game.add!(player2)
    game.choose(player2, 'paper')
    expect(game.result).to eq("#{player2.name} wins")
  end

  it 'scissors defeats paper' do
    game.add!(player)
    game.choose(player, 'paper')
    game.add!(player2)
    game.choose(player2, 'scissors')
    expect(game.result).to eq("#{player2.name} wins")
  end

end