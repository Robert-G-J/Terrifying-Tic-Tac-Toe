class Player
  attr_reader :token

  def initialize(args={})
    @token = args[:token]
  end
end
