require 'pry'
class TicTacToe

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

attr_accessor :board

  def initialize(board = Array.new(9," "))
  
  @board = board
  
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
  
  def move(index,piece)
    @board[index] = piece
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
    num_of_turns = 0
    @board.each do |move|
      if move == "X" || move == "O"
        num_of_turns += 1
      end
    end
    return num_of_turns 
 end
 
 def current_player
   if turn_count % 2 == 0
     return "X"
   else
     "O"
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  piece = current_player
  if valid_move?(index)
    move(index, piece)
    display_board
  else
    turn
  end
end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
    
      ((@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X") ||
       
      ((@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O")
        
      end
  end 
  
  def full?
  @board.all?{|occupied| occupied != " "}
  end
  
  def draw?
  !(won?) && (full?)
  end
  
  def over?
  won? || full? || draw?
end
  
  def winner
    
    WIN_COMBINATIONS.detect do |win_combo|
    
        if  ((@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X") 
  
              return "X"
       
      elsif ((@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O")
        
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