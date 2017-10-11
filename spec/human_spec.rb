require 'human'

describe Human do
  subject(:human) { described_class.new(token:'🐝') }

  it { is_expected.to respond_to :token }
end
