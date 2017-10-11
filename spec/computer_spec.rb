require 'computer'

describe Computer do
  subject(:computer) { described_class.new(token:'🤖') }

  it { is_expected.to respond_to :token }
end
