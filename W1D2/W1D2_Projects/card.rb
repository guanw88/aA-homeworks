require_relative 'board.rb'
require_relative 'game.rb'
require_relative 'human_player.rb'

class Card

attr_reader :card_value, :face_up

  def initialize(card_value, face_up = false)
    @card_value = card_value
    @face_up = face_up
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def self.create_card(value)
    Card.new(value)
  end

  # def to_s
  #
  # end
  #
  # def ==
  #
  # end

  # def create_deck_hash
  #
  #   deck = {}
  #
  #   values = ["A"] + (2..9).map(&:to_s).to_a + ["T", "J", "Q", "K"]
  #   suits = ["D", "C", "H", "S"]
  #
  #   row, column = 0, 0
  #   (1..52).each do |num|
  #
  #     deck[num] = [values[column], suits[row]]
  #
  #     column += 1
  #     if column > 12
  #       row += 1
  #       column = 0
  #     end
  #   end
  #   deck
  # end

end
