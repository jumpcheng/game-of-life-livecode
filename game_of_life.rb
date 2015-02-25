class Board
  def initialize(board_str)
    @board = board_str.split(',').map do |row_str|
      row_str.split('').map do |cell_str|
        Cell.new(cell_str)
      end
    end
    @height = @board.length
    @width = @board.first.length
  end

  def next
    @board.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        neighbors = neighbors_alive(y, x)
        if cell.alive
          cell.alive_next = [2,3].include?(neighbors)
        else
          cell.alive_next = (neighbors == 3)
        end
      end
    end

    @board.each do |row|
      row.each do |cell|
        cell.next
      end
    end
  end

  # (-1, -1) (-1, 0) (-1, +1)
  # (0, -1)   (0, 0) (+1, 0)
  # (+1, -1)  (+1, 0) (+1, +1)
  def neighbors_alive(y, x)
    num_alive = 0
    (-1..1).each do |dy|
      (-1..1).each do |dx|
        num_alive += (alive_at?(y - dy, x - dx) ? 1 : 0) unless (dy == 0 && dx == 0)
      end
    end
    num_alive
  end

  def alive_at?(y, x)
    return false if y < 0 || x < 0 || y >= @height || x >= @width
    @board[y][x].alive
  end

  def to_s
    @board.map do |row|
      row.map(&:to_s).join('')
    end.join("\n")
  end
end

class Cell
  attr_accessor :alive, :alive_next

  def initialize(cell_str)
    @alive = (cell_str == 'X')
    @alive_next = nil
  end

  

  def to_s
    @alive ? 'X' : '.'
  end
end

board = Board.new(".XX.,....,....,XXXX")
puts board
# board.next
# puts board