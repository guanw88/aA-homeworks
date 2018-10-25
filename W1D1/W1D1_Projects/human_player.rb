class HumanPlayer
  
  attr_reader :name
  attr_accessor :losses
  
  def initialize(name = "George")
    @name = name
    @losses = 0
  end
  
  def guess
    puts "It is now #{@name}'s turn to choose a letter."
    puts "Pick a lowercase letter: "
    letter = gets.chomp
  end
  
  def alert_invalid_guess
    puts "Invalid entry. Please choose another lowercase letter."
  end
end