
class TicTacToe 
  
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
      [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
      ]
  
  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(users_input)
      users_input.to_i - 1
      #.to_i means turn into integer 
  end
  
  def move(index, token)
      @board[index] = token
  end

  def position_taken?(index)
      ((@board[index] == "X") || (@board[index] == "O"))
  end

  def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
  end

  def turn_count 
      @board.count{|block| block !=" "}
  end 
  
  def current_player 
      turn_count.even? ? "X" : "O"
  end

  def turn 
      puts "Please enter a number (1-9):"
      users_input = gets.strip 
      index = input_to_index(users_input)
      if valid_move?(index)
        token = current_player
        move(index, token)
      else
        turn
      end
      display_board
  end
  
  def won?
      WIN_COMBINATIONS.any? do |combo|
      if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
        return combo
    elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
        return combo
      end
    end
  end
  
  def full?
      @board.all?{|occupied| occupied != " "}
  end
  
  def draw?
      !won? && full?
  end
  
  def over?
      won? || full? || draw?
  end 
  
  def winner
      if combo = won?
      @board[combo[0]]
    end
  end
  
  def play
      while over? == FALSE
        turn
      end
      if won?
      puts "Congratulations #{winner}!" 
      elsif draw?
      puts "Cat's Game!"
      end
  end
end 

  


