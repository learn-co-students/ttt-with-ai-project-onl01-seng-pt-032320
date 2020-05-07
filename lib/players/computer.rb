require 'pry'
module Players 
    class Computer < Player 

        def move(board) 
           computer_move(board) 
        end

        def computer_move(board) 
            middle_move(board) || corner_move(board) || empty_side_move(board)
        end 

        def corner_move(board)
            corners = [1,3,7,9]
            corners.detect{|corner| !board.taken?(corner)}
        end 

        def empty_side_move(board)
            sides = [2,4,6,8]
            sides.detect{|side| !board.taken?(side)}
        end 

        def middle_move(board)
            if !board.taken?("5")
                 "5" 
            end 
        end 

    end 
end 


