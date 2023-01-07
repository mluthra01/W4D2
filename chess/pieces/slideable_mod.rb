require_relative 'range_mod'

module Slideable
include InRange
    HORIZONTAL_DIRS = [[0,1],[0,-1],[1,0],[-1,0]]
    DIAGONAL_DIRS = [[1,1], [1,-1],[-1,1],[-1,-1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves_arr = []
        move_dirs.each do |dir|
            moves_arr += grow_unblocked_moves_in_dir(dir[0], dir[1])
        end
        moves_arr
    end

    private
    def grow_unblocked_moves_in_dir(dx, dy)
        moves_arr = []
        new_pos = [self.pos[0] + dx, self.pos[1] + dy]
        while within_range?(new_pos) && self.board[new_pos].empty?
            moves_arr << new_pos
            new_pos = [new_pos[0] + dx, new_pos[1] + dy]
        end
        moves_arr
    end
end