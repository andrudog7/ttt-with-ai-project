class Game

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
]

attr_accessor :board, :player_1, :player_2, :winner

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        board.turn_count.even? ? player_1 : player_2
    end

    def won?
        winning_combo = []
        WIN_COMBINATIONS.map do |combo|
            if board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X"
                winning_combo << combo 
                @winner = "X"
            elsif board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O"
                winning_combo << combo
                @winner = "O"
            end
        end
        winning_combo == [] ? false : winning_combo.flatten
    end

    def draw?
        board.full? && won? == false ? true : false 
    end

    def over?
        won? != false or draw? ? true : false 
    end

    def winner 
        won? == false ? nil : @winner
    end

    def turn
        input = current_player.move(board)
        if board.valid_move?(input) 
            board.update(input, current_player)
        else
            turn
        end
    end

    def play 
        turn until over?
        if won? 
            puts "Congratulations #{winner}!"
        elsif draw? 
            puts "Cat's Game!"
        end
    end

end