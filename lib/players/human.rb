module Players

class Human < Player
    def move(board)
        puts "Please select a number between 1 and 9."
        gets.strip
    end
end

end