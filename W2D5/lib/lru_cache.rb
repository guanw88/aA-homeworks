require 'byebug'
# Tonight we're going to implement a basic LRU Cache using an array. This will be a
# simple implementation that doesn't use a hash-map or linked list. We will assume
# our input is limited to Fixnums, Strings, Arrays, Symbols, and Hashes. We will
# allow the user to set the size of the cache.
#
# Ultimately, our LRU Cache should function as follows:
#
  # johnny_cache = LRUCache.new(4)
  #
  # johnny_cache.add("I walk the line")
  # johnny_cache.add(5)
  #
  # johnny_cache.count # => returns 2
  #
  # johnny_cache.add([1,2,3])
  # johnny_cache.add(5)
  # johnny_cache.add(-5)
  # johnny_cache.add({a: 1, b: 2, c: 3})
  # johnny_cache.add([1,2,3,4])
  # johnny_cache.add("I walk the line")
  # johnny_cache.add(:ring_of_fire)
  # johnny_cache.add("I walk the line")
  # johnny_cache.add({a: 1, b: 2, c: 3})
#
#
#   johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]

class LRUCache
  attr_accessor :cache
  def initialize(size)
    @cache = Array.new(size, nil) #[nil, nil, nil, nil] with size = 4
  end

  def count # o(n) time because reject has to iterate through entire cache
    @cache.reject{|el| el.nil?}.length
  end

  def add(el) # o(n) time because iteration needed to see if el is in cache already
    if is_el_present?(el)
      @cache.reject!{|el_in_cache| el_in_cache == el}.push(el)
    else
      @cache.shift
      @cache << el
    end
  end

  def show
    @cache
  end

  private
  def is_el_present?(el)
    @cache.each do |el_in_cache|
      return true if el == el_in_cache
    end
    false
  end

end
