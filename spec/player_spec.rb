require 'player'

describe Player do
	
  let(:player) {Player.new('Bibiana')}

  it 'should be initialize with a name' do
    expect(player).to have_name
  end

  it 'should be initialize with an empty score' do
    expect(player.score).to eq(0)
  end
end