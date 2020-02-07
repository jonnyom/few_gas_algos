def form_palindrome(input)
  hash = Hash.new(0)
  input.each_char { |char| hash[char] += 1 }
  odd_count = 0

  hash.each do |_key, value|
    odd_count += 1 unless value % 2 == 0
    return "No palindrome" if odd_count > 1
  end

  build_output(hash, input.length)
end

def build_output(hash, input_length)
  middle_character = ""
  output = ""

  hash.each do |key, value|
    middle_character = key unless value % 2 == 0
    pointer = value / 2

    while pointer > 0
      output << key
      output.insert(0, key)
      pointer -= 1
    end
  end

  if !middle_character.empty?
    output.insert(input_length / 2, middle_character)
  end
  output
end

puts form_palindrome(ARGV[0])
