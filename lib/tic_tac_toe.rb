class TicTacToe
#if any of these happen you win! :)
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
#initializeing the board
def initialize
  @board = Array.new(9, " ")
end
#this is the actual board and whenever this is called it will print the board
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

#takes the get input and makes it an int
def input_to_index(input)
  input.to_i - 1
end

#so if you just started the game it will start with X, then it takes the input that I turned into an int and says that you will put a X or O in there
def move(index, current_player = "X")
  @board[index] = current_player
end
#sees if the place it taken if it has a X || O
def position_taken?(index)
  (@board[index] == "O" || @board[index] == "X")
end
#checks to see if you can take the move you put in
def valid_move?(index)
  (index.between?(0,8) && !position_taken?(index))
end

#go over this
def turn
  puts "Please choose a number 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(index)
    player_token = current_player
    move(index, player_token)
    display_board
  else
    turn
  end
end

def turn_count
  turn = 0
  @board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn
end


 #if the turn count is an even number, that means O just went, so the next/current player is X
def current_player
 
  if !turn_count.odd?
    player = "X"
  else
    player = "O"
  end
  return player
end

def won?
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def full?
  @board.all? {|index| index == "X" || index == "O"}
end

def over?
  if won? || draw?
    return true
  else
    return false
  end
end

def winner
  index = []
  index = won?
  if index == false
    return nil
  else
    if @board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end


def draw?
  if !won? && full?
    return true
  else
    return false
  end
end

def play
  until over? == true
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end