require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
    def initialize(board)
        @cursor = Cursor.new([0,0], board)
        @board = board
    end


    def render
        until @cursor.get_input == @cursor.cursor_pos
            @board.render
            @cursor.get_input
        end
    end
end