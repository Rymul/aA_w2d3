require "byebug"

# class MarkError < StandardError
#     def message
#       'That is an invalid position or is already marked'
#     end
#   end



class Board
    attr_reader :n
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, '_')} #will later change 3 to n
        @n = n
    end

    def valid?(position)
        row, col = position
        if (row < n && col < n) && (row >= 0 && col >= 0)
            return true
        else
            return false
        end
    end

    def empty?(position)
        row, col = position
        if @grid[row][col] == '_'
            return true
        else
            return false
        end
    end

    def place_mark(position, mark)
        # begin
            row, col = position
            if self.valid?(position) && self.empty?(position)
                @grid[row][col] = mark
            else
                raise 'That is an invalid position or is already marked!'
            end
        # rescue RuntimeError => e
        #     puts e.message
        # retry
        # end
    end

    def print
        puts
        puts
        @grid.each_with_index do |subarr, i|
            if i == (subarr.length - 1)
                
                n_sub = subarr.map do |ele|
                    if ele == '_'
                        ele = ' '
                    else
                        ele
                    end
                end
                puts ' ' + n_sub.join(' | ') + ' '
            else

                puts '_' + subarr.join('_|_') + '_'
            end
            # puts '_' + subarr.join('_|_') + '_'
        end
        puts
        puts
    end
        
    def win_row?(mark)
        if @grid.any? {|row| row.uniq == [mark] }
            return true
        end
        false
    end

    def win_col?(mark)
        if @grid.transpose.any? {|col| col.uniq == [mark] }
            return true
        end
        false
    end

    def win_diagonal?(mark)
        height = @grid.length #3
        if (0...height).all? { |i| @grid[i][i] == mark } || (0...height).all? { |i| @grid[i][height-i-1] == mark }
        # if major?(mark) || minor?(mark)
            return true
        else
            return false
        end
    end

    # def major?(mark) #left -> right
    #     height = @grid.length #3
    #     (0...height).all? { |i| @grid[i][i + 1] == mark }
        # check = [] 
        # (0...heigth)each do |i| 
        #     check << @grid[i][i+1]
        #     if check.uniq.length == 1
        #         return true
        #     end
        # end
        # false
    # end

    # def minor?(mark) #right -> left
    #     height = @grid.length #3
    #     (0...height).all? { |i| @grid[i][height-i-1] == mark }
        # check = [] 
        # (0...height).each do |i| 
        #     check << @grid[i][height-i-1]
        #     if check.uniq.length == 1
        #         return true
        #     end
        # end
        # false
    # end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? { |ele| ele == '_' }
    end



end


#test cases

# p b = Board.new 
# b.place_mark([0, 0], :X)
# b.place_mark([1, 0], :X)
# # debugger
# b.place_mark([2, 0], :X)

# p b
# b.print
# p b.win?(:X)




