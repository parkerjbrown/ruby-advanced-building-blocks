# PROJECT 02: Reverse-Engineering Enumerable Methods

module Enumerable

  def my_each
    for item in self
      yield(item) if block_given?
    end
  end

  def my_each_with_index
    index = 0
    for item in self
      yield(item, index) if block_given?
      index += 1
    end
  end

  def my_select
    if self.is_a? Array
      results = []
      self.my_each { |item| results << item if yield(item)}
    else
      results = Hash.new
      self.my_each { |key, value| results[key] = value if yield(key, value)}
    end
    return results
  end

  def my_all?
    if self.is_a? Array
      my_each { |item| return false if !yield(item)}
    else
      my_each { |key, value| return false if !yield(key, value)}
    end
    return true
  end

  def my_any?
    if self.is_a? Array
      my_each { |item| return true if yield(item)}
    else
      my_each { |key, value| return true if yield(key, value)}
    end
    return false
  end

  def my_none?
    if self.is_a? Array
      my_each { |item| return false if yield(item)}
    else
      my_each { |key, value| return false if yield(key, value)}
    end
    return true
  end

  def my_map
    results = []
    my_each { |item| results << yield(item) }
    return results
  end

  def my_inject(sum = nil)
    my_each { |item| sum = yield(sum, item) }
    return sum
  end

  def multiply_els
    self.my_inject(1) { |sum, item| sum * item }
  end

  def my_map_mod(input = nil)
    results = []
    if block_given?
      my_each { |item| results << yield(item) }
    elsif proc
      my_each { |item| results << input.call(item) }
    end
    return results
  end

end