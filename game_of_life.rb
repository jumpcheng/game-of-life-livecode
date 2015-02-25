class Board
  def initialize(board_str)
    board_str.split(',').each do |row_str|
      row_str.split('').each do |cell_str|
        print cell_str
      end
      puts 
    end
  end
end

class Cell

end

board = Board.new(".XX.,....,....,XXXX")
# board.next
# puts board