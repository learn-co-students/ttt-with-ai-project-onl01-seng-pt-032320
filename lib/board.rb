class Board

  attr_accessor :cells

  def reset!
    @cells = []
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input = gets)
    @cells[user_input.to_i - 1]
  end

  def full?
    @cells.all? {|index| index == "X" || index == "O"}
  end

  def turn_count
    @cells.count{|token| token == "O" || token == "X"}
  end

  def taken?(index)
    if @cells[index.to_i - 1] == " "
      false
    else
      true
    end
  end

  def valid_move?(index)
    index = index.to_i
    if index.between?(1,9) && @cells[(index - 1)] == " " 
      true
    else
      false
    end
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end

end