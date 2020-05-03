module Players 
    class Computer < Player 

        def move(board)  
            random = rand(1..9).to_s
            !board.taken?(random) ? random : move(board)
        end 

        

    end 
end 


