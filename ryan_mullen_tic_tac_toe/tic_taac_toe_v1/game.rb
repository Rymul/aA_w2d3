require_relative "board.rb"
require_relative "human_player.rb"

class Game
    
    def initialize(n)
        @player_1 = Human_player.new(:X)
        @player_2 = Human_player.new(:O)
        @current_player = @player_1
        @board = Board.new(n)
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        elsif @current_player == @player_2
            @current_player = @player_1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "VICTORY! You win!"
                return
            else
                switch_turn
            end
        end
        puts "We have come to a draw"
    end
end


















