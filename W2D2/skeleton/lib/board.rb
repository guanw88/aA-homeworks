require 'byebug'
class Board

  SCORE_CUPS = [6,13]
  P1_SCORE_CUP = [6]
  P2_SCORE_CUP = [13]

  attr_accessor :cups

  def initialize(name1 = "p1", name2 = "p2")
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones(num_stones = 4)
    stones = []
    num_stones.times {stones << :stone}
    cups.each_index {|idx| cups[idx] += stones unless SCORE_CUPS.include?(idx)}
    SCORE_CUPS.each {|idx| cups[idx] = []}
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13 || SCORE_CUPS.include?(start_pos)
      raise "Invalid starting cup"
      return false
    elsif cups[start_pos].empty?
      raise "Starting cup is empty"
      return false
    end
    true
  end

  def make_move(start_pos, current_player_name)
    if valid_move?(start_pos)
      stones_in_hand = cups[start_pos].dup
      cups[start_pos] = []
      idx = start_pos
      # debugger
      until stones_in_hand.empty?
        idx = (idx + 1) % 14
        opposing_player_cup = 13
        cups[idx] << stones_in_hand.pop unless idx == opposing_player_cup
      end
    else

    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
