require_relative 'modules'
require_relative '../piece'

class Rook < Piece
    include Slideable

    def initialize(color, board, pos)
        super
    end

    def symbol
        :R
    end

    private
    def move_dirs
    end
end

class Bishop < Piece
    include Slideable

    def initialize
        super
    end

    def symbol
        :B
    end
    
    private
    def move_dirs
    end
end

class Queen < Piece
    include Slideable

    def initialize
        super
    end

    def symbol
        :Q
    end

    private
    def move_dirs
    end
end

#require_relative '../board'
#b = Board.new
#r = Rook.new(:white, b, [3,3])
#p r.moves