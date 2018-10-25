require 'byebug'

class Array
  def my_each(&prc)
     self_copy = self.dup
     i = 0
     while i < self_copy.length
       self_copy[i] = prc.call(self_copy[i])
       i += 1
     end
     self
  end

  def my_select(&prc)
    selected = []
    self.my_each do |el|
      selected << el if prc.call(el)
    end
    selected
  end

  def my_reject(&prc)
    rejected = []
    self.my_each do |el|
      rejected << el if prc.call(el) == false
    end
    rejected
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_flatten
    new_arr = []
    self.my_each do |el|
      if (el.is_a? Array) == false
        new_arr << el
      else
        el.my_each { |sub_el| new_arr << sub_el }
      end
    end
    has_arr = Proc.new{ |el| el.is_a? Array }
    if new_arr.my_any?(&has_arr)
      new_arr.my_flatten
    else
      new_arr
    end
  end

  def my_zip(*args)
    zipped = []
    row = []
    (0...self.length).to_a.my_each do |idx|
      el = self[idx]
      row = [el]
      args.my_each { |arr| row << arr[idx]}
      # row << *args[idx]
      zipped << row
    end
    zipped
  end

  def my_rotate(start = 1)
    self.slice(start%self.length, self.length) + self.slice(0,start%self.length)
  end

  def my_join(joiner = "")
    new_str = ""
    self.my_each do |el|
      new_str += el + joiner
    end
    new_str = new_str.chomp(joiner) unless joiner == ""
    new_str
  end

  def my_reverse
    reversed = []
    (0...self.length).to_a.my_each { |idx| reversed.unshift(self[idx]) }
    reversed
  end
end
