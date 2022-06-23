require_relative "board.rb"
require_relative "human_player.rb"

require "byebug"
class Game
    attr_reader :n
    def initialize(n, *num_marks)
        @num_marks = num_marks
        @symbol_arr = num_marks.map {|letter| letter.upcase.to_sym}
        @player_arr = Array.new(@num_marks.length) {|i| Human_player.new(@symbol_arr[i]) }
        @current_player = @player_arr[0]
        @board = Board.new(n)
        @n = n
    end

    def switch_turn
        if @current_player == @player_arr[0]
            @player_arr.rotate!
            @current_player = @player_arr[0]
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


















