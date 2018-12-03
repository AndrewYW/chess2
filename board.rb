require_relative 'nullpiece'
class Board 
    attr_reader :grid
    def initialize
        @grid = place_pieces

    end

    def place_pieces
        array = []
        2.times do |i|
            array << Array.new(8){Piece.new}
        end
        4.times do |i|
            array << Array.new(8){NullPiece.new}
        end
        2.times do |i|
            array << Array.new(8){Piece.new}
        end
        array
    end

    def move_piece(start_pos, end_pos)
        #raise exceptions: no piece at start, can't move to end

        raise "No piece at start_pos" if grid[start_pos[0]][start_pos[1]].is_a?(NullPiece)
        raise "Can't move to end_pos" unless grid[end_pos[0]][end_pos[1]].is_a?(NullPiece)

        grid[end_pos[0]][end_pos[1]] = grid[start_pos[0]][start_pos[1]]
        grid[start_pos[0]][start_pos[1]] = NullPiece.new
    end

    def [](pos)
        x, y = pos 
        grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        grid[x][y] = val
    end
end