class Game 
    attr_accessor :board, :player_1, :player_2 


    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end 


    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]
   
    def current_player 
        board.turn_count.even? ? @player_1 : @player_2 
    end 

    def won? 
        WIN_COMBINATIONS.detect do |win_combination| 
            win_combination.all? {|win_index| board.cells[win_index] == "X"} || win_combination.all? {|win_index| board.cells[win_index] == "O" }
        end 
    end 

   def draw?
        board.full? && !won?  
   end 

   def over? 
        board.full? || won? || draw? 
   end 

    def winner 
        won? ? (board.cells[won?[0]]) : nil    
    end 

    def turn
        user_input = current_player.move(board) 
        board.valid_move?(user_input) ? board.update(user_input, current_player) : turn 
    end 

    def play
        turn until over? 
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat\'s Game!"
        end
    end 


end 


