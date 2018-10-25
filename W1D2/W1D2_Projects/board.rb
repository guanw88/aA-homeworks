require_relative 'card.rb'
require_relative 'game.rb'
require_relative 'human_player.rb'

class Board

  DECK = {
    1 => ["A","D"],
    2 => ["A","H"],
    3 => ["2","D"],
    4 => ["2","H"],
    5 => ["3","D"],
    6 => ["3","H"],
    7 => ["4","D"],
    8 => ["4","H"]
  }

  attr_reader :grid

  def initialize(grid = Array.new(4) {Array.new(2)})
    @grid = grid
  end

  def populate
    shuffled_cards = (1..8).to_a.shuffle #change to 52 later
    row, column = 0, 0
    shuffled_cards.each do |card_value|
      @grid[row][column] = Card.new(card_value)
      column += 1
      if column > 1 #change to 12/13 later
        row += 1
        column = 0
      end
    end
  end


  def render
    @grid.each do |row|
      row.each do |card|
        print " | #{show_info(card)} | "
      end
      puts "\n"
    end
    # (0..3).each do |idx|
    #   puts "#{@grid[idx]}"
    # end
  end

  def show_info(card)
    if card.face_up
      DECK[card.card_value].join("")
    else
      "??"
    end
  end

  def won?
    @grid.flatten.all? {|card| card.face_up == true}
  end

  def reveal(guessed_pos)

    card = self[guessed_pos]
    card.reveal
  end

  def hide(guessed_pos)
    #debugger
    card = self[guessed_pos]
    card.hide
  end

  def [](position)
    row, column = position
    @grid[row][column]
  end

  def []=(position,value)
    row, column = position
    @grid[row][column] = value
  end

end
