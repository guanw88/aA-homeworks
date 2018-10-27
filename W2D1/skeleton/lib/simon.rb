class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if game_over == false
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each {|color| puts "The color is: #{color}"}
    sleep(5)
    system("clear")
  end

  def require_sequence
    seq.each do |color|
      print "What is the next color in the sequence? (e.g. red, blue, green, yellow): "
      user_input = gets.chomp
      @game_over = true if color != user_input
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Correct! Proceeding to next round..."
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    initialize
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
