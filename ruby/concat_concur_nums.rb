# [1, 2, 3, 5, 8, 13, 14, 15] --> "1-3,5,8,13-15"
# input = [1, 2, 3, 5, 8, 13, 14, 15]
# 1 -> temp
# 2 -> skip
# 3 -> end
# 5 -> OK append
input = [1,2,3,4,15,18,19,20,21,23,24,25,26,37,19]

def concat_concur_nums(input)
  pointer_a = input[0]
  output = pointer_a.to_s
  counter = 1
  while counter < input.size
    if input[counter] - pointer_a > 1 || input[counter] - pointer_a < 0
      output << ",#{input[counter]}"
      pointer_a = input[counter]
      counter += 1
    else
      output << "-"
      while counter < input.size && input[counter] - pointer_a == 1
        pointer_a = input[counter]
        counter += 1
      end
      output << input[counter - 1].to_s
    end
  end
  output
end

def range_concat(input)
  pointer_a = input[0]
  range = Range.new(start: pointer_a)
  ranges = input.map do |pointer_b|
    if pointer_b - pointer_a > 1 || pointer_b - pointer_a < 0
      range = Range.new(start: pointer_b)
    elsif pointer_b - pointer_a == 1
      range.last = pointer_b
    end
    pointer_a = pointer_b
    range
  end.map { |r| r.to_string }.uniq.join(",")
end

class Range
  attr_accessor :start, :last

  def initialize(start:, last: nil)
    @start = start
    @last = last
  end

  def to_string
    return "#{start}" if last.nil?
    "#{start}-#{last}"
  end
end

puts concat_concur_nums(input)
puts range_concat(input)
