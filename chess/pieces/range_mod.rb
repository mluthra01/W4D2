module InRange
    def within_range?(pos)
        pos[0] < 8 && pos[0] >= 0 && pos[1] < 8 && pos[1] >= 0
    end
end