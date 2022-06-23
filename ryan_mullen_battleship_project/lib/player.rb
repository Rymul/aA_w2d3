class Player
    def get_move
        p 'enter a position with coordinates separated with a space like `4 7`'
        move = gets.chomp
        row = move[0]
        col = move[-1]
        [row.to_i, col.to_i]
    end
end



