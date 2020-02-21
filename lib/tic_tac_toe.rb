class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
  
  def move(index, token)
    @board[index] = token
  end 
  
  def position_taken?(index)
    (@board[index] == "X") || (@board[index] == "O")
  end 
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end 
  
  def turn
    puts "Enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end
    
  def turn_count
    number_turns = 0 
    @board.each do |spot|
      if spot == "X" || spot == "O"
        number_turns += 1 
      end
    end
    return number_turns
  end 
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else 
      "O"
    end 
  end
  
  def won?
    WIN_COMBINATIONS.find do |winning|
      if (@board[winning[0]]) == "X" && (@board[winning[1]]) == "X" && (@board[winning[2]]) == "X"
        return winning
      elsif (@board[winning[0]]) == "O" && (@board[winning[1]]) == "O" && (@board[winning[2]]) == "O"
        return winning
      end
        false
    end
  end
  
  def full?
    @board.all? {|filled| filled != " "}
  end 
  
  def draw?
    full? && !won?
  end 
  
  def over?
    full? || won? || draw?
  end 
  
  def winner
    WIN_COMBINATIONS.find do |winning|
      if (@board[winning[0]]) == "X" && (@board[winning[1]]) == "X" && (@board[winning[2]]) == "X"
        return "X"
      elsif (@board[winning[0]]) == "O" && (@board[winning[1]]) == "O" && (@board[winning[2]]) == "O"
        return "O"
      else
        nil
      end 
    end
  end

  def play
    while over? == false
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end 

end 


