module Slideable
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
        if self.is_a?(Rook) || self.is_a?(Queen)
            horizontal_dirs.each do |dir|
                moves_arr += grow_unblocked_moves_in_dir(dir[0], dir[1])
            end
        end

        if self.is_a?(Bishop) || self.is_a?(Queen)
            vertical_dirs.each do |dir|
                moves_arr += grow_unblocked_moves_in_dir(dir[0], dir[1])
            end
        end
        moves_arr
    end

    private
    def within_range?(pos)
        pos[0] < 8 && pos[0] > 0 && pos[1] < 8 && pos[1] > 0
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        moves_arr = []
        new_pos = [self.pos[0] + dx, self.pos[1] + dy]
        while within_range?(new_pos) && self.board[new_pos] == nil
            moves_arr << new_pos
            new_pos = [new_pos[0] + dx, new_pos[1] + dy]
        end
        moves_arr
    end
end

module Stepable
    def moves
    end

    private
    def move_diffs

    end
end