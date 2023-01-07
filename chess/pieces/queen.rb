require_relative "slideable_mod"
require_relative '../piece'

class Queen < Piece
include Slideable

    def initialize(color, board, pos)
        super
    end

    def symbol
        :Q
    end

    private
    def move_dirs
        horizontal_dirs + vertical_dirs
    end
end

