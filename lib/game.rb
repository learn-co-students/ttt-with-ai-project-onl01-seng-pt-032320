class Game

  attr_accessor :board, :player_1, :player_2
 
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6] ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end

 def won?
  WIN_COMBINATIONS.each do |combo|
   index_0 = combo[0]
   index_1 = combo[1]
   index_2 = combo[2]

   position_1 = board.cells[index_0]
   position_2 = board.cells[index_1]
   position_3 = board.cells[index_2]

   if position_1 == "X" && position_2 == "X" && position_3 == "X"
     return combo
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return combo
    end
  end
    return false
  end

  def draw?
    if board.full? && !won?
      true
    else
      false
    end
  end
  
  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    winning_combo = []
    winning_combo = won?
    if winning_combo == false
       nil
     elsif board.cells[winning_combo[0]] == "X"
       return "X"
     else
       return "O"
     end
   end

   def turn
    puts "Please enter a number 1-9:"
    @user_input = current_player.move(@board)
    if @board.valid_move?(@user_input)
      @board.update(@user_input, current_player)
    else puts "Please enter a number 1-9:"
      @board.display
      turn
    end
    @board.display
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