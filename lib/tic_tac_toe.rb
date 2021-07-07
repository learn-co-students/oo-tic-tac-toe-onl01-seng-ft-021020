require 'pry'
class TicTacToe
   attr_accessor :board, :cells, :current_player
  
  def initialize
    @board =  [" "," "," "," "," "," "," "," "," "]
  end
  WIN_COMBINATIONS =[
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 4, 8],
      [2, 4, 6],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]

  def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]}  "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]}  "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]}  "
  # binding.pry
  
  end
  
    def input_to_index(input)
      input.to_i - 1
    end
  
  
  
    def move(index, current_player)
      board[index] = current_player
    end
    
    
    
    def position_taken?(position)
       board[position] == "X" || board[position] == "O"
    end
    
    
    
    def valid_move?(position)
      position.between?(0,8) && !position_taken?(position)
    end
    
    
    
    def turn_count
      board.count("X") + board.count("O")
    end
    
    
    
      def current_player
          if turn_count.even? 
          "X"
            elsif turn_count.odd?
              "O"
           end
      end
     
     
     
     def turn
       puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      
            if valid_move?(index)
             
            move(index, current_player)
             display_board 
            else
              turn
            end
      end
      
      
      
      
      def won?
 
         win = nil
       WIN_COMBINATIONS.each do |combo|
      
       winning_spot1 = combo[0]
       winning_spot2 = combo[1]
       winning_spot3 = combo[2]
       
       if board[winning_spot1] == "X" &&
        board[winning_spot2] == "X" &&
         board[winning_spot3] == "X" 
       win = combo
       
     elsif board[winning_spot1] == "O" &&
        board[winning_spot2] == "O" &&
         board[winning_spot3] == "O" 
       win = combo
       
     else 
       false
      end
   end
  win
end




 def full?
    board.all? do |i| 
      if i == "X" || i == "O"
        true 
    else 
      false 
    end
    end
    end
    
    
    
    
    def draw? 
     full? && !won? 
       end
  
    
      
      
      
        def over? 
         # binding.pry
        draw? || won? || full?
        end
        
   
   
   
    def winner 
       if  self.won?
           @board[won?[0]]

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
    
    
          
      
        #win = nil
      # self.won?.each do |combo|
      
      # winning_spot1 = combo[0]
      # winning_spot3 = combo[2]
       
# board.assoc(WIN_COMBINATIONS)

#board.keep_if { |v| v =~ /[aeiou]/ }

#oard.each{|i| i == "X" || "O" puts