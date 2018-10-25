require_relative 'board.rb'
require_relative 'game.rb'
require_relative 'card.rb'
class HumanPlayer

  def initialize(name = "Armando")
    @name = name
  end

  def get_move(board)
    valid_move = false
    puts "What is your move? row, column: "
    unless valid_move
      move = gets.chomp.split(",").map(&:to_i)
      card = board[move]
      if card.face_up == false
        valid_move = true
        return move
      else
        puts "SORRY! INVALID MOVE... TRY AGAIN:"
        get_move
      end
    end

  end

end
