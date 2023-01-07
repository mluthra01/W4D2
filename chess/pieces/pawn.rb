require_relative '../piece'
require_relative 'range_mod'

class Pawn < Piece
include InRange

    def initialize(color, board, pos)
        super
    end

    def symbol
        :p
    end

    def moves
        forward_steps + side_attacks
    end

    private
    def at_start_row?
        row, col = @pos
        (@color == :red && row == 1) || (@color == :black && row == 6)
    end

    def forward_dir
        if @color == :red 
            return 1
        else @color == :black 
            return -1
        end
    end

    def forward_steps
        moves_arr = []
        row, col = @pos
        next_step = [row + forward_dir, col]

        if within_range?(next_step) && @board[next_step].empty? 
            moves_arr << next_step
        end

        two_step = [row + forward_dir * 2, col]
        if  within_range?(two_step) && at_start_row? && @board[two_step].empty? 
            moves_arr << two_step
        end

        moves_arr
    end

    def side_attacks
        row, col = @pos
        moves_arr = [[row+forward_dir, col-1], [row+forward_dir, col+1]]
        moves_arr.select do |move|
            within_range?(move) && !@board[move].empty?
        end
    end
end