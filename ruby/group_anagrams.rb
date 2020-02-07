sample_input = ['won', 'pat', 'cat', 'own', 'now', 'apt', 'dog', 'tap']
hash = Hash.new { |hash, k| hash[k] = [] }
sample_input.each do |word|
  key = word.chars.sort.join
  hash[key].push(word)
end
puts hash.values.flatten
