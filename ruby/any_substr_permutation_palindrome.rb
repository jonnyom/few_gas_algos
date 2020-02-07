require "set"
require "benchmark"

def is_palindrome?(string)
  return if string.empty?
  palindrome = string.length > 1 && string == string.reverse
  puts "string=#{string} is_palindrome=#{palindrome}"
  palindrome
end

class GenerateWithSet

  def self.generate_substrings_with_array(input)
    input.each_char.with_index do |_char, index|
      permutations = []
      substr = input[index..input.length - 1]
      permutations << generate_permutations_with_set(substr)
      permutations.flatten.each do |perm|
        if is_palindrome?(perm)
          puts perm
          return true
        end
      end
    end
    false
  end

  def self.generate_permutations_with_set(input, i = 0, permutations = Set.new([]))
    return if i == input.length
    permutations << input
    (i..input.size-1).each do |j|
      input[i], input[j] = input[j], input[i]
      generate_permutations_with_set(input, i+1, permutations)
      input[i], input[j] = input[j], input[i]
    end
    permutations.to_a
  end

  def self.is_substr_perm_palindrome_with_array?(input)
    if is_palindrome?(input)
      puts input
      return true
    end
    generate_substrings_with_array(input.dup)
  end

end

class GenerateWithFlag

  def self.generate_permutations_with_flag(input, i = 0, palindrome = false)
    return if i == input.length
    (i...input.size).each do |j|
      input[i], input[j] = input[j], input[i]
      if is_palindrome?(input)
        palindrome = true
        break
      end
      generate_permutations_with_flag(input, i+1, palindrome)
      input[i], input[j] = input[j], input[i]
    end
    palindrome
  end

  def self.generate_substrings_with_flag(input)
    input.each_char.with_index do |_char, index|
      substr = input[index..input.length - 1]
      value = generate_permutations_with_flag(substr)
      return value if value
    end
    false
  end

  def self.is_substr_perm_palindrome_with_flag?(input)
    if is_palindrome?(input)
      puts input
      return true
    end
    generate_substrings_with_flag(input.dup)
  end
end

def find_substr_rec(input, index, length, current = "")
  return if index == length
  return true if is_palindrome?(current)
  counter = index + 1
  while counter < length
    current += input[counter]
    ret_val = find_substr_rec(input, counter, length, current)
    return true if ret_val
    current = current[0...current.length - 1]
    counter += 1
  end
  false
end

flag = Benchmark.measure { puts "Flag suffixes: #{GenerateWithFlag.is_substr_perm_palindrome_with_flag?(ARGV[0].dup)}" }
# array = Benchmark.measure { puts "Array suffixes: #{GenerateWithSet.is_substr_perm_palindrome_with_array?(ARGV[0].dup)}" }
# all_perms = Benchmark.measure { puts "All perms substrs: #{find_substr_rec(ARGV[0].dup, -1, ARGV[0].length)}" }
puts "Flag timing: #{flag}"
# puts "Array timing: #{array}"
# puts "All perms timing: #{all_perms}"
