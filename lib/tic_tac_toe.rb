class TicTacToe
  
  WIN_COMBINATIONS=[
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
  @board = Array.new(9, " ")
  end


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

  def input_to_index (input)
    input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(position)
    !@board[position].include?(" ")
  end

  def valid_move?(position)
    return false if (position < 0 || position > 8)
    !position_taken?(position)
  end

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

  def turn_count
    count=0
    @board.each do |i|
      if i == "X" || i== "O"
        count +=1
      end
    end
      return count
  end


  def current_player
    player_x = "X"
    player_o = "O"
    if @board.count("X")==@board.count("O")
      return player_x
    else
      return player_o
    end
  end

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

  def full?
    !@board.include?(" ")
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end


  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      champion = won?
      @board[champion[0]]
    else
      return NIL
  end
end

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


