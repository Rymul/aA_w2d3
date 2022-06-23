class ToolongError < StandardError
    def message
        "You put in too many numbers! Try again."
    end
end

class Human_player
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        begin
            puts
            puts
            p "Let's play tic tac toe! Enter a position with coordinates (0 through 2) separated with a space like `0 2`"
            puts
            puts
            position = gets.chomp
            check = position.split(' ')
            numbers = '0123456789'
            check.each do |ele|
                unless numbers.include?(ele)
                    raise "Those aren't numbers! Try again."
                end
            end
            if check.length > 2
                raise "You put in too many numbers! Try again."
            end
            row = position[0]
            col = position[-1]
            [row.to_i, col.to_i]
        rescue ToolongError => e
            puts e.message
        retry
        end
    end
end    




# p1 = Human_player.new
# p1.get_position