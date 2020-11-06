class Board
attr_accessor :cells

    def reset!
        @cells.clear
        9.times do @cells << (" ")
        end
    end

    def initialize
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts " ----------- "
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts " ----------- "
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
        position = input.to_i - 1
        cells[position]
    end

    def full?
        cells.any?(" ") ? false : true 
    end

    def turn_count
        count = 0
        cells.each do |space|
            if space != " "
            count += 1
            end
        end
        count
    end

    def taken?(input)
        position(input) == " " ? false : true 
    end

    def valid_move?(input)
        input.to_i.between?(1, 9) == true && taken?(input) == false ? true : false 
    end

    def update(input, player)
       place = input.to_i - 1
       cells[place] = player.token
    end
end