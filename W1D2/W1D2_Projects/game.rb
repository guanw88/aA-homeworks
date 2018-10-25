require_relative 'card.rb'
require_relative 'board.rb'
require_relative 'human_player.rb'
require 'byebug'

class Game


  def initialize(board = Board.new, player = HumanPlayer.new)
    @board = board
    @player = player
  end

  def play
    @board.populate
    @board.render
    while @board.won? == false
      play_turn
    end
    puts "CONGRATULATIONS! YOU WIN!"
  end

  def play_turn
    first_move = @player.get_move(@board)
    @board.reveal(first_move)
    @board.render
    second_move = @player.get_move(@board)
    @board.reveal(second_move)
    @board.render
    if same_card?(first_move, second_move) == false
      @board.hide(first_move)
      @board.hide(second_move)
    end
    sleep(5)
    system("clear")
    @board.render

  end


  def get_card(position)
    row, column = position
    @board.grid[row][column]
  end

  def same_card?(position_one, position_two)
    card_one = get_card(position_one)
    card_two = get_card(position_two)
    Board::DECK[card_one.card_value].first == Board::DECK[card_two.card_value].first

  end
end

if __FILE__==$PROGRAM_NAME
  game = Game.new
  game.play
end
