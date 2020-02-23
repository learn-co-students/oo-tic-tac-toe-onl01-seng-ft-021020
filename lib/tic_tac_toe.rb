

class TicTacToe
  
  attr_accessor :board
  
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[2,4,6]
    ]
  
  def initialize
    @board = Array.new(9," ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(index)
    index.to_i - 1 
  end
  
  def move(player_choose_index, player_token ="X")
    @board[player_choose_index] = player_token
  end
  
  def position_taken?(index)
    if @board[index] == " "
      false 
    else 
      true 
    end
  end
  
  def valid_move?(position)
    if position < 0 || position > 8 || position_taken?(position)==true 
      false 
    else 
      true
    end
  end
  
  def turn 
    puts "Please enter 1-9:"
    input = gets.strip
    index  = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index,token)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    counter = 0 
    @board.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
      end
    end
    counter
  end
  
  def current_player
    if turn_count.odd? 
      "O"
    else    
      "X"
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" &&  (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      else
        false
      end
    end
  end
   
  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end
  
  def draw?
    !(won?) && (full?)
  end
  
  def over?
    won? || full? || draw?
  end
  
  def winner
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" &&  (@board[win_combo[2]]) == "X"
        return "X"
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return "O"
      else
        nil
      end
    end
  end
  
  def play 
    until over?
      turn
    end
  
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end