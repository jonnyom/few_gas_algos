def form_palindrome(input)
  hash = Hash(Char, Int32).new(0)
  input.each_char { |char| hash[char] += 1 }
  odd_count = 0
  hash.each do |_key, value|
    odd_count += 1 unless value % 2 == 0
    return "No palindrome" if odd_count > 1
  end
  build_output(hash, input.size)
end

def build_output(hash, input_length : Int32)
  middle_character = ""
  output = ""

  hash.each do |key, value|
    middle_character = key.to_s unless value % 2 == 0
    pointer = value / 2

    while pointer > 0
      output += key
      output = output.insert(0, key.to_s)
      pointer -= 1
    end
  end

  if !middle_character.nil?
    middle_point = (input_length/2).to_i
    output.insert(middle_point, middle_character)
  end
  output
end

puts form_palindrome(ARGV[0])
