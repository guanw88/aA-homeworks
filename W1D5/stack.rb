# Exercise 1 - Stack
# Let's write a Stack class. To do this, use the following framework:
#
# To test that your code works, create a new instance of the Stack class, and play
# around with adding and removing elements. Remember, a stack follows the principle of LIFO!

class Stack
  def initialize(contents = [])
    @contents = contents
  end

  def push(el)
    @contents << el
  end

  def pop
    @contents.pop
  end

  def peek
    @contents[-1]
  end
end
