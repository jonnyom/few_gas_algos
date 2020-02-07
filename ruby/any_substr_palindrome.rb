def find_substr_palindrome(input)
  find_substr_palindrome_rec(input, input.length-1)
end

def find_substr_palindrome_rec(input, original_length)
  return false if input.length < 2
  if is_palindrome?(input)
    puts input
    return true
  end
  find_substr_palindrome_rec(input[1...original_length], original_length)
end

def find_substr_rec(input, index, length, current, substrs = [])
  return if index == length
  counter = index + 1
  puts "COUNTER: #{counter}, INDEX: #{index}, LENGTH: #{length}, CURRENT: #{current}, SUBSTRS: #{substrs}"
  substrs << current unless current.empty?
  while counter < length
    current += input[counter]
    find_subseq_substr_rec(input, counter, length, current, substrs)
    current = current[0...current.length - 1]
    counter += 1
  end
  substrs
end

def is_palindrome?(string)
  string == string.reverse
end

def find_subseq_substr(input)
  puts find_substr_rec(input, -1, input.length, "")
end

def find_subseq_substr_palindrome(input)
  substrs = find_subseq_substr_rec(input, -1, input.length, "")
  puts substrs.any? { |sub| is_palindrome?(sub) }
end

puts find_subseq_substr_palindrome(ARGV[0].dup)
# puts find_subseq_substr(ARGV[0].dup)
