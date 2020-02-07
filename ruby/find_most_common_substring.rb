# GAH I'm A FOOL
def find_most_common_substr(input, n)
  hash = Hash.new(0)
  i = 0
  max_substr = ""
  max_amount = 0
  n = n.to_i
  while i <= input.length - n -1
    key = input[i..i+n-1]
    hash[key] += 1
    if hash[key] > max_amount && max_substr != key
      max_substr = key
      max_amount = hash[key]
    end
    i+=1
  end
   max_substr
end

puts find_most_common_substr(ARGV[0], ARGV[1])
