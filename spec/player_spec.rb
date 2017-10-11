require 'player'

describe Player do
  subject(:player) { described_class.new(token:'👑') }

  it { is_expected.to respond_to :token } 
end
