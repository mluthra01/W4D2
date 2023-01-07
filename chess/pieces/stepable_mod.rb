require_relative 'range_mod'

module Stepable
include InRange

    def moves
        new_moves = []
        move_diffs.each do |dir|
            row, col = dir
            new_pos = [self.pos[0] + row, self.pos[1] + col ]
            if within_range?(new_pos) && self.board[new_pos].empty?
                new_moves << new_pos
            end
        end
        new_moves
    end
end
