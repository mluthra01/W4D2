class Piece

    attr_accessor :color, :board, :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
    end

    def empty?
        self.is_a?(NullPiece)
    end

    def valid_moves
        self.moves
    end

    def pos=(val)
        
    end

    def Symbol
        self.symbol
    end

    private
    def move_into_check?(end_pos)
    end
end