module Players 
    class Human < Player 

        def move(board)
            puts "Player X, please enter 1 - 9:"
            input = gets.strip 
        end 

    end 
end
