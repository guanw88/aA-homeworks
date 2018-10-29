require 'byebug'
class Board

  SCORE_CUPS = [6,13]
  P1_SCORE_CUP = [6]
  P2_SCORE_CUP = [13]

  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1 = "p1", name2 = "p2")
    @cups = Array.new(14){Array.new}
    @name1 = name1
    @name2 = name2
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
      until stones_in_hand.empty?
        idx = (idx + 1) % 14
        cups[idx] << stones_in_hand.pop unless idx == opposing_player_goal(current_player_name)
      end
      render
      next_turn(idx)
    else

    end
  end

  def opposing_player_goal(current_player_name)
    if name1 == current_player_name
      return 13
    else
      return 6
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if cups[ending_cup_idx].length == 1 && ending_cup_idx != 6 && ending_cup_idx != 13
      return :switch
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? {|cup| cup.empty?} || cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
  end
end
