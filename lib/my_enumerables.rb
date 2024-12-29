# For practice purposes, I am not just going to delegate to existing methods,
# instead will implement each of them with #each. I am sure some of these has quirks I am ignoring
# but if there were important enough, tests would have covered them :D

module Enumerable
  def my_each_with_index
    i = 0
    each do |el|
      yield(el, i)
      i += 1
    end
    self
  end

  def my_select
    result = []
    each do |el|
      include = yield(el)
      result << el if include
    end
    result
  end

  def my_all?
    each do |el, i|
      return false unless yield(el, i)
    end
    true
  end

  def my_any?
    each do |el, i|
      return true if yield(el, i)
    end
    false
  end

  def my_none?(&block)
    !my_any?(&block)
  end

  def my_count
    count = 0
    each do |el|
      count += 1 if !block_given? || yield(el)
    end
    count
  end

  def my_map
    results = []
    each do |el|
      results << yield(el)
    end
    results
  end

  def my_inject(acc = 0)
    each do |el|
      acc = yield(acc, el)
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < size
      yield self[i]
      i += 1
    end
    self
  end
end
