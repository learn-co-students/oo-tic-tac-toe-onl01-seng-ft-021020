class TicTacToe 
  #constant 
  WIN_COMBINATIONS=[
    [0,1,2],#Top row
    [3,4,5],#mid row
    [6,7,8],#bot row
    [0,3,6],#first column
    [1,4,7],#second column 
    [2,5,8],#third column 
    [0,4,8],#diagnol
    [6,4,2]#diagnol
    ]
  
  #initializing new array size 9
  def initialize 
  @board = Array.new(9, " ")
  end 
  
  #prints the board using .each method. 
  #when count%3 print a new line 
  def display_board
    count = 0
    @board.each do |i|
      count+=1
      if count%3==0
        print " #{i} \n-----------\n"
      else 
        print " #{i} |"
      end 
    end 
  end 
  
  #converts the users normal input to array index
  def input_to_index (input)
    input.to_i - 1
  end 
  
  #Places the player token into the board
  def move(index, token="X")
    @board[index] = token
  end 
  
  #true or false if position is taken on the board, if position is taken return true.
  #checks to see if the board has " ", if so that means the position is free and return false
  def position_taken?(position)
    !@board[position].include?(" ")
  end 
  
  #checks to see if the move is valid 
  #true if valid, false if outside of range or if position_taken? is false
  def valid_move?(position)
    return false if (position < 0 || position > 8)
    !position_taken?(position)
  end 
  
  #gathers input from user, gets.chomp to take away the white space 
  #if valid_move is true, place the token at the index and display the board
  #else ask for the users input again
  def turn 
    position = gets.chomp
    index = input_to_index(position)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      turn
    end 
  end 
  
  #returns the number of turns that have been played
  def turn_count
    count=0
    @board.each do |i|
      if i == "X" || i== "O"
        count +=1
      end 
    end 
      return count
  end 
  
  #looks to see who is the current player, 
  #X goes first so if x.count == o.count then its x turn
  def current_player
    player_x = "X"
    player_o = "O"
    if @board.count("X")==@board.count("O")
      return player_x
    else 
      return player_o
    end 
  end 
  
  #checks to see if there is a winner and returns the winner indexes in an array 
  #iterate through the constant, since we know that the array within the constant array is size 3 we can compare each index if its X or O
  #if there is no winner return false
  def won?
    WIN_COMBINATIONS.each do |win|
      if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] =="X"
        return win
        
      elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] =="O"
        return win 
      end 
    end 
    return false 
  end
  
  
  #checks to see if the board is full by seeing if the @board array has any " ".
  #if array has " " that means board is not full => false 
  def full?
    !@board.include?(" ")
  end 
  
  #method for if the game is a draw
  #if the board is full and won is false then return true
  def draw?
    if full? && !won?
      return true 
    else 
      return false 
    end 
  end 
  
  #method to see if the game is over
  #if won returns a winner or full is true then the game is over
  def over?
    if won? || draw?
      return true 
    else 
      return false
    end 
  end 
  
  #returns the winner
  #if there is a winner look to see at the first place in the return array won?
  def winner 
    if won?
      champion = won?
      @board[champion[0]]
    else 
      return NIL
  end 
end 

#play method
#keeps asking for turns until the game is over
#if there is a winner print the winner 
#if there is a draw print that its a draw 
def play
  until over? == true 
    turn
  end
  
  if won?
    champion = winner
    puts "Congratulations #{champion}!"
    
  elsif draw?
    puts "Cat's Game!"
  end 
end 


end