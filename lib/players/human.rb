module Players 
    class Human < Player 

        def move(board)
            puts "Please enter 1-9"
            input = gets.strip 
        end 

        def corner 
            #if move to one of the corners, code computer to move to middle 
        end

        def top 
        #if move to index in bottom row, code comp to move to either side on bottom 
        end 

        def bottom 
        #if move to index in top, code comp to move to either side on top 
        end 


    end 
end
