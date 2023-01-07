require 'colorize'
require_relative 'cursor'

class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
        @start_pos = nil
        @end_pos = nil
    end

    def render
        board_display = @board.rows.map do |row|
            row.map do |piece|
                piece.symbol.to_s.colorize(piece.color)
            end
        end
        
        board_display.each_with_index do |row, x|
            row.each_with_index do |piece, y|
                if (x + y).even?
                    square_print = (piece + " ").colorize(:background => :yellow)
                else
                    square_print = (piece + " ").colorize(:background => :white)
                end
                square_print = square_print.colorize(:background => :blue) if @cursor.cursor_pos == [x, y]
                print square_print
            end
            puts
        end
        pos = @cursor.get_input
        if pos != nil
            if @start_pos == nil
                @start_pos = pos
            else
                @end_pos = pos
                @board.move_piece(:red, @start_pos, @end_pos)
                @start_pos = nil
            end
        end
        system("clear")
        render
    end
end