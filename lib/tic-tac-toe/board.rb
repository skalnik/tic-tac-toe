class Board
  # Board Positions:
  # 0 | 1 | 2
  # ---------
  # 3 | 4 | 5
  # ---------
  # 6 | 7 | 8

  def initialize
    @board = Array.new()
  end

  def to_s
    str = "-----------\n"
    (1..3).to_a.each do |i|
      str << " #{@board[(i*3)-3] || (i*3)-2} | #{@board[(i*3)-2] || (i*3)-1} | #{@board[(i*3)-1] || i*3} \n"
      str << "-----------\n"
    end
    str
  end

  def place_marker(marker, location)
    if location < 9 && location >= 0
      unless @board[location].nil?
        raise 'Location already taken'
      else
        @board[location] = marker
      end
    else
      raise 'Location does not exist'
    end
  end

  def get_winner
    return @board[0] if(@board[0] == @board[1] && @board[1] == @board[2]) # Top Row
    return @board[3] if(@board[3] == @board[4] && @board[4] == @board[5]) # Middle Row
    return @board[6] if(@board[6] == @board[7] && @board[7] == @board[8]) # Bottom Row
    return @board[0] if(@board[0] == @board[4] && @board[4] == @board[8]) # Diagonal from Top Right
    return @board[2] if(@board[2] == @board[4] && @board[4] == @board[6]) # Diagonal from Top Left
    return nil                                                             # No one has won
  end

  def game_over?
    (0..8).inject(true) { |val, i| val && @board[i] } || get_winner
  end
end

