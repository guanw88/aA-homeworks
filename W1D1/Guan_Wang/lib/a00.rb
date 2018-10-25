require 'byebug'
# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  letters = ("a".."z").to_a
  new_str = ""
  str.each_char do |char|
    if char == " "
      new_str << " "
    else
      char_idx = nil
      letters.each_with_index do |letter, idx|
        char_idx = idx if char == letter
      end
      new_str << letters[(char_idx + shift) % 26]
    end
  end
  new_str
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => digital_root(11) => (2)

def digital_root(num)
  sum = 0
  while num != 0
    sum += num % 10
    num = (num - num % 10)/10
  end
  debugger if sum == 15
  if sum >= 10
    sum = digital_root(sum)
  end
  sum
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  new_str = ""
  str_freq = Hash.new(0)
  str.each_char do |char|
    str_freq[char] += 1
  end
  alphabet = ("a".."z").to_a if alphabet == nil
  alphabet.each do |letter|
    new_str << letter * str_freq[letter]
  end
  new_str
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    indices = []
    self.each_with_index do |el, idx|
      self.each_with_index do |el2, idx2|
        if el + el2 == 0 && idx < idx2
          indices << [idx,idx2]
        end
      end
    end
    indices
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    valid_words = []
    word_array = self.split("")
    i = 0
    while i < word_array.length
      length = 1
      while length < word_array.length
        candidate_word = word_array.slice(i, length).join("")
        if dictionary.include?(candidate_word)
          valid_words << candidate_word
        end
        length += 1
      end
      i += 1
    end
    return valid_words.uniq
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  factors = []
  (1..num).to_a.each do |n|
    factors << n if num%n == 0
  end
  factors
end
