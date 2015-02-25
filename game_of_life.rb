class Board
  def initialize(board_str)
    @board = board_str.split(',').map do |row_str|
      row_str.split('').map do |cell_str|
        Cell.new(cell_str)
      end
    end
  end

  def to_s
    @board.map do |row|
      row.map(&:to_s).join('')
    end.join("\n")
  end
end

class Cell
  attr_reader :alive

  def initialize(cell_str)
    @alive = (cell_str == 'X')
  end

  def to_s
    @alive ? 'X' : '.'
  end
end

board = Board.new(".XX.,....,....,XXXX")
puts board
# board.next
# puts board