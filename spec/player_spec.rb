require 'player'

describe Player do
	
  let(:player) {Player.new('Bibiana')}

  it 'should be initialize with a name' do
    expect(player).to have_name
  end
end