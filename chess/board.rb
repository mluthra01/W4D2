require_relative './pieces/rook'
require_relative './pieces/queen'
require_relative './pieces/bishop'
require_relative './pieces/pawn'
require_relative './pieces/rook'
require_relative './pieces/knight'
require_relative './pieces/king'
require_relative './pieces/null_piece'
require 'set'
require 'colorize'

class Board
    attr_reader :rows

    def initialize
        @null_piece = NullPiece.instance
        @rows = Array.new(8) { |row| Array.new(8) { |col| @null_piece}}
        p1_color = :red
        p2_color = :black
        @rows[0][0] = Rook.new(p1_color, self, [0,0])
        @rows[0][7] = Rook.new(p1_color, self, [0,7])
        @rows[7][0] = Rook.new(p2_color, self, [7,0])
        @rows[7][7] = Rook.new(p2_color, self, [7,7])
        @rows[0][1] = Knight.new(p1_color, self, [0,1])
        @rows[0][6] = Knight.new(p1_color, self, [0,6])
        @rows[7][1] = Knight.new(p2_color, self, [7,1])
        @rows[7][6] = Knight.new(p2_color, self, [7,6])
        @rows[0][2] = Bishop.new(p1_color, self, [0,2])
        @rows[0][5] = Bishop.new(p1_color, self, [0,5])
        @rows[7][2] = Bishop.new(p2_color, self, [7,2])
        @rows[7][5] = Bishop.new(p2_color, self, [7,5])
        @rows[0][3] = Queen.new(p1_color, self, [0,3])
        @rows[7][3] = Queen.new(p2_color, self, [7,3])
        @rows[0][4] = King.new(p1_color, self, [0,4])
        @rows[7][4] = King.new(p2_color, self, [7,4])
        (0...8).each do |y|
            @rows[1][y] = Pawn.new(p1_color, self, [1,y])
            @rows[6][y] = Pawn.new(p2_color, self, [6,y])
        end
    end
    
    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos,val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(color, start_pos, end_pos)
        numberset = Set[0,1,2,3,4,5,6,7]
        p start_pos
        p end_pos
        within_range = numberset.include?(end_pos[0]) && numberset.include?(end_pos[1])
        if within_range && !self[start_pos].empty? && self[end_pos].empty?
            self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
        else
            raise ArgumentError.new("Invalid move")
        end
    end

    def in_check?(color)
        king_pos = get_king_pos(color)
        @rows.any? do |row|
             row.any? { |p|  p.color != color && p.valid_moves.include?(king_pos) }
         end
    end
    
    def get_king_pos(color)
        @rows.each do |row|
            row.each do |p|
                return p.pos if p.is_a?(King) && p.color == color
            end
        end
    end
end