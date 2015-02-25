class Board
  def initialize(board_str)
    @board = board_str.split(',').map do |row_str|
      row_str.split('').map do |cell_str|
        Cell.new(cell_str)
      end
    end
  end
end

class Cell
  attr_reader :alive

  def initialize(cell_str)
    @alive = (cell_str == 'X')
  end
end

board = Board.new(".XX.,....,....,XXXX")
# board.next
# puts board