class TicTacToe 
  
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
    
  def initialize 
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    
  end 
  
  def input_to_index(input)
    input.to_i - 1
  end 
  
  def move(index, token = "X") 
    @board[index] = token
  end 
  
  def position_taken?(index) 
    if @board[index] == "X" || @board[index] == "O" 
      true 
    else 
      false 
    end 
  end 
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end 
  
  def turn_count
    turn = 0 
    @board.each do |index| 
      if index == "X" || index == "O"
        turn += 1 
      end 
    end
    turn
  end 
  
  def current_player
    if turn_count.odd? 
      "O"
    elsif turn_count.even? 
      "X"
    end 
  end 
  
  def turn 
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    current = current_player
    if valid_move?(index)
      move(index, current)
      display_board
    else 
      turn
    end
  end 
  
   def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      end
        false
    end
  end
  
   def full?
    @board.all?{|occupied| occupied != " "}
   end
 
  def draw? 
    if !won? && full? 
      true 
    else 
      false 
    end 
  end 
  
  def over? 
    won? || draw?
  end 

  def winner 
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return "X"
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return "O"
      end
        false
    end
  end 

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end 
