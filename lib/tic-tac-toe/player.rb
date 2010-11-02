class Player
  def initialize(marker)
    @marker = marker
  end

  def make_move(board, location)
    board.place_marker(@marker, location.to_i - 1)
  end
end
