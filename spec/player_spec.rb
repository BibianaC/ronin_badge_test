require 'player'

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

describe Player do
	
  let(:player) {Player.new('Bibiana')}

  it 'should be initialize with a name' do
    expect(player).to have_name
  end

  it 'should be able to choose' do
    player.choose('rock')
    expect(player.choice).to eq 'rock'
  end

end