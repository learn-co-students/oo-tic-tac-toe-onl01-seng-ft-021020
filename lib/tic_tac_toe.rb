class TicTacToe
  
  
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    
    [0,3,6], # left column
    [1,4,7],  # Middle column
    [2,5,8],  # right column
    
    [0,4,8],  # left-right diagonal
    [2,4,6]  # right-left diagonal
  
  ]
  
  def initialize
    @board =Array.new(9, " ")
    
    #@board = ["1","2","3","4","5","6","7","8","9"] #for testing
  end

  def display_board
    row_counter = 0
    
    row = " "
    @board.each_with_index do |i, index|
      
      row += i
      
      column_counter = index % 3
      row_counter = index / 3

      if(column_counter == 0 || column_counter == 1)
        row += " | "
      else
        row += " "
        puts row
        if(row_counter == 0 || row_counter == 1)
          puts "------------"
        end
        row = " "
      end

    end
    
  end
  
  def input_to_index(input)
    return (input.to_i - 1)
  end
  
  def move(index, player_token = "X")
    @board[index] = player_token
  end
  
  def position_taken?(index)
    return (@board[index] == "O" || @board[index] == "X")
  end
  
  def valid_move?(position)
    if(position < 0 || position >= 9)
      return false
    end
    
    if(position_taken?(position))
      return false
    end
    
    return true
  end
  
  def turn_count
    counter = 0
    
    @board.each do |b|
      if(b == "X" || b == "O")
        counter += 1
      end
    end
    
    return counter
  end
  
  def current_player
    if (turn_count.even?)
      return "X"
    end
    return "O"
  end
  
  def turn
    
    input = gets
    index = input_to_index(input)
    while (valid_move?(index) == false) do
      input = gets
      index = input_to_index(input)
    end
    
    move(index, current_player)
    display_board
    
  end
  
  def won?
    WIN_COMBINATIONS.each do |wc|
      if(@board[wc[0]] == "O" &&
         @board[wc[1]] == "O" &&
         @board[wc[2]] == "O")
        return wc
      end
      
      if(@board[wc[0]] == "X" &&
         @board[wc[1]] == "X" &&
         @board[wc[2]] == "X")
        return wc
      end
    end
    
    return false
  end
  
  def full?
    if(@board.include?(" ")  == false)
      return true
    end
    return false
  end
  
  def draw?
    if(full? == true && won? == false)
      return true
    elsif (won? == true)
      return false
    elsif (won? == false && full? == false)
      return false
    end
  end
  
  def over?
    if(won? != false || full? == true)
      return true
    end
    return false
  end
  
  def winner
    if(won? == false)
      return nil
    else
      if (current_player == "X")
        return "O"
      elsif (current_player == "O")
        return "X"
      end
    end
  end
  
  def play
    puts "Welcome to Tic! Tac! Toe!"
    display_board
    
    while (over? == false)
      turn
      if(won? == true)
        break
      end
      if(draw? == true)
        break
      end
    end
    
    if(draw?)
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
    
  end

end


#ttt = TicTacToe.new

#ttt.play

