require_relative './pieces/slideable_pieces'
require 'set'

class Board
    def initialize
        @rows = Array.new(8) { |e| e = Array.new(8, nil) }
        @rows[0][0] = Rook.new(:white, self, [0,0])
        @rows[0][7] = Rook.new(:white, self, [0,7])
        @rows[7][0] = Rook.new(:black, self, [7,0])
        @rows[7][7] = Rook.new(:black, self, [7,7])
        @rows[]
#        @rows.each_with_index do |row, x|
#            if x < 2 || x > 5
#                row.each_index do |y|
#                    @rows[x][y] = Piece.new(:white, self, [x, y])
#                end
#            end
#        end
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
        numberset = Set['0','1','2','3','4','5','6','7']
        within_range = numberset.include?(end_pos[0]) && numberset.include?(end_pos[1])
        if within_range && self[start_pos] != nil && self[end_pos] == nil
            self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
        else
            raise ArgumentError.new("Invalid move")
        end
        
    end

    def print_board
        @rows.each do |row|
            row.each do |elem|
                if elem == nil
                    print "N "
                else
                    print elem.symbol.to_s + " "
                end
            end
            puts
        end
        puts
    end
end

b = Board.new
b.print_board