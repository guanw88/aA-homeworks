
require 'byebug'
require_relative 'human_player.rb'

class GhostGame
  NUM_ROUNDS = 5
  GHOST_HASH = {
    0 => "",
    1 => "G",
    2 => "GH",
    3 => "GHO",
    4 => "GHOS",
    5 => "GHOST"
  }
  
  attr_reader :dictionary
  
  def initialize(player1 = HumanPlayer.new("Josh"), player2 = HumanPlayer.new("George")) 
    @player1 = player1 
    @player2 = player2
    @fragment = ""
    @dictionary = Hash.new()
    @current_player = @player1
    @previous_player = @player2
    @winner = nil
  end 

  def load_dictionary 
    words = File.readlines("dictionary.txt").map {|word| word.chomp}
    words.each do |word|
      @dictionary[word] = []
      str = ""
      word.each_char do |char|
        str += char 
        @dictionary[word] << str
      end 
    end 
  end 

  def play_round
    take_turn(@current_player)
    puts "Current fragment is: #{@fragment}"
    next_player! 
  end
  
  def take_turn(player)
    letter_added = false
    while letter_added == false
      letter = player.guess
      if valid_play?(@fragment + letter)
        @fragment += letter 
        letter_added = true
      else 
        player.alert_invalid_guess
      end 
    end
  end
  
  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end
  
  def valid_play?(string)
    @dictionary.any? { |k, v| v.include?(string)}
  end
  
  def record(player)
    GHOST_HASH[player.losses]
  end 
  
  def play 
    self.load_dictionary
    until game_over?

      until @dictionary.has_key?(@fragment)
        play_round
      end
      
      puts "#{@current_player.name} wins this round!"
      @previous_player.losses += 1
      puts "Current Status: #{@player1.name}: #{record(@player1)} | #{@player2.name}: #{record(@player2)}"
      @fragment = ""
    end
    
    if @player1.losses == NUM_ROUNDS
      @winner = @player2.name
    elsif @player2.losses == NUM_ROUNDS
      @winner = @player1.name
    end
      
    puts "#{@winner} is the overall winner!"
  end 
  
  def game_over?
    if @player1.losses == NUM_ROUNDS || @player2.losses == NUM_ROUNDS
      return true
    end
    false 
  end
end 

if __FILE__ == $PROGRAM_NAME 
  GhostGame.new.play
end 