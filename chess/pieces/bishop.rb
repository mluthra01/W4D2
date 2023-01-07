require_relative "slideable_mod"
require_relative '../piece'

class Bishop < Piece
include Slideable

    def initialize(color, board, pos)
        super
    end

    def symbol
        :B
    end
    
    private
    def move_dirs
        vertical_dirs
    end
end