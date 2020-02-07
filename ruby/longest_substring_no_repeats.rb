input = "pwwkew"
# input = "aaabbbb"
# input = " "

def length_of_longest_sub_str(input)
  return 1 if input.length == 1
  longest_sub_str_size = 0

  (0...input.length - 1).each do |i|
    sub_str = input[i]
    (i + 1...input.length).each do |j|
      break if sub_str.include?(input[j])
      sub_str << input[j]
    end
    longest_sub_str_size = sub_str.length if sub_str.length > longest_sub_str_size
  end
  longest_sub_str_size
end

require "set"

def length_of_longest_sub_str_set(input)
  pointer_1 = 0
  pointer_2 = 0
  max = 0

  set = Set.new
  while pointer_2 < input.length
    pp set
    if (!set.include?(input[pointer_2]))
      set.add(input[pointer_2])
      max = [max, set.size].max
      pointer_2 += 1
    else
      set.delete(input[pointer_1])
      pointer_1 += 1
    end
    pp set
  end
  max
end

puts length_of_longest_sub_str_set(input)
puts length_of_longest_sub_str(input)
