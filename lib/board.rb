class Board

  attr_reader :state
  attr_writer :state

  def initialize
    @state = []
  end
  
  def occupied?(index)
    state[index.to_i] != nil
  end
end
