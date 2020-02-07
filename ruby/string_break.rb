# input = "Wordbreakproblem"
# dict = ["this", "th", "is", "famous", "Word",
# 										"break", "b", "r", "e", "a", "k", "br",
# 										"bre", "brea", "ak", "problem"]

input = "applepenapple"
dict = ["apple","pen"]

def word_break(word, dict)
  return true if word.size == 0

  (1..word.size).each do |i|
    prefix = word[0...i]
    if dict.include?(prefix) && word_break(word[i...word.size], dict)
      return true
    end
  end

  false
end

def dp_word_break(word, dict, lookup)
  n = word.size - 1
  return true if word.empty?

  if lookup[n] == -1
    lookup[n] = 0

    (1..word.size).each do |i|
      prefix = word[0...i]
      if dict.include?(prefix) && dp_word_break(word[i...word.size], dict, lookup)
        lookup[n] = 1
        return true
      end
    end
  end
  lookup[n] == 1
end

lookup = Array.new(input.size, -1)
puts word_break(input, dict)
puts dp_word_break(input, dict, lookup)
