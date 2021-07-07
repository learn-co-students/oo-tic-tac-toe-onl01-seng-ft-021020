require "pry"

class TicTacToe
  
    WIN_COMBINATIONS = [
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [6,4,2],
    [3,4,5],
    [6,7,8]
    ]
  
  def initialize(board = Array.new(9, " "))
    @board = board
  end
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(number)
    number = number.to_i
    index = number - 1 
    index
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] != " "
    
    # if @board[index] == "X" || @board[index] == "O"
    #   true
    # else
    #   false
    # end
  end
  
  def valid_move?(position)
    if @board[position] != " " || position >= 9 || position < 0
      false 
    else
      true
    end
  end
    
  def turn_count
    @count = 0
    @board.each do |x|
      if x == "X" || x == "O"
        @count += 1
      end
    end
    @count
  end
  
  def current_player
    if turn_count == 0 
      "X"
    elsif turn_count == 1
      "O"
    else
      turn_count % 2 == 0 ? "X" : "O"
    end
  end
  
  def turn
    puts "Specify a position between 1-9"
    user = gets.chomp
    index_move = input_to_index(user)
    if valid_move?(index_move)
      move(index_move, current_player)
    else
      puts "Invalid move. Please select another position from 1-9"
      turn
    end
    display_board
  end
        
  def won?
    @out = []
    WIN_COMBINATIONS.any? do |x|
      if @board[x[0]] != " " && @board[x[0]] == @board[x[1]] && @board[x[0]] == @board[x[2]]
       #@out = [x[0], x[1], x[2]]
       return x 
      end
    end
    # if @out.length == 3
    #   @out
    # else
    #   false
    # end
  end
    
  def full?
    @board.all? do |x| 
      x != " " 
    end
    
    # if turn_count == 9 
    #   true
    # else
    #   false
    # end
  end
  
  def draw?
    if !won? && full?
      return true
    end
    
    # elsif !won? && !full?
    #   return false
    # elsif won?.all?{|x| x.is_a? Integer}
    #   return false
    # end
  end
    
  def over?
    won? || draw?
    
    # if !won? == false || full?
    #   true
    # elsif !won? && !full?
    #   false
    # end
  end
  
  def winner
    if !won? == false
      @board[won?[0]]
    else
      nil
    end
  end
  
  
  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
  # def play
  #   loop do
  #     turn
  #     if over?
  #       if !won? == false
  #         puts "Congratulations the winner is #{winner}"
  #         break
  #       elsif draw?
  #         puts "Cat's Game!"
  #         break
  #       end
  #     end
  #   end
  # end

end