# Exercise 2 - Queue
# Now let's write a Queue class. We will need the following instance methods: enqueue(el), dequeue, and peek.
#
# Test your code to ensure it follows the principle of FIFO.

class Queue
  def initialize(contents = [])
    @contents = contents
  end

  def enqueue(el)
    @contents << el
  end

  def dequeue
    @contents.shift
  end

  def peek
    @contents[0]
  end
end
