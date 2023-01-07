require_relative 'stepable_mod'
require_relative '../piece'

class King < Piece
include Stepable

    def initialize(color, board, pos)
        super
    end

    def symbol
        :K
    end
    
    def move_diffs
        [[-1, -1],
        [-1, 0],
        [-1, 1],
        [0, -1],
        [0, 1],
        [1, -1],
        [1, 0],
        [1, 1]]
    end
end