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

        raise "No piece at start_pos" if self[start_pos].is_a?(NullPiece)
        raise "Can't move to end_pos" unless self[end_pos].is_a?(NullPiece)

        self[end_pos] = self[start_pos]
        #grid[start_pos[0]][start_pos[1]] = NullPiece.new
        self[start_pos] = NullPiece.new
    end

    def valid_pos?(pos)
        (0..7).include?(pos[0]) && (0..7).include?(pos[1])
    end

    def [](pos)
        x, y = pos 
        grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        grid[x][y] = val
    end

    def render
        puts "    " + (0..7).to_a.join("    ")
        grid.each_with_index do |row, i|
            puts "#{i} #{row.map{|space| space.to_s}}"
        end

        puts "poop"
    end
end