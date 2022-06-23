class Board
    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](position)
        row, column = position
        @grid[row][column]
    end

    def []=(position, value)
        row, column = position
        @grid[row][column] = value
    end

    def num_ships
        count = 0
        @grid.each do |subarr|
            subarr.each do |val|
                if val == :S
                    count += 1
                end
            end
        end
        count
    end

    def attack(position)
        row, column = position
        if self[position] == :S
            self[position]= :H
            p "you sunk my battleship!"
            return true
        else self[position]= :X
            return false
        end
    end

    def place_random_ships
        total_ships = @size * 0.25
        while self.num_ships < total_ships
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            position = [rand_row, rand_col]
            self[position]= :S
        end
    end

    def hidden_ships_grid
        @grid.map do |suba|
            suba.map do |val|
                if val == :S
                    :N
                else
                    val
                end 
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |subarr|
            puts subarr.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end



