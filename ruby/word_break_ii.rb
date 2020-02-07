input = "Wordbreakproblem"
dict = ["this", "th", "is", "famous", "Word",
										"break", "b", "r", "e", "a", "k", "br",
										"bre", "brea", "ak", "problem"]

def word_break(s, word_dict)
    DFS(s, word_dict, {})
end

def DFS(input, dictionary, cache)
    return cache[input] if cache[input]
    result = []

    if input.empty?
        result << ""
    else
        dictionary.each do |word|
            if input.start_with?(word)
                sub_list = DFS(input[word.size..input.size], dictionary, cache)
                sub_list.each do |sub|
                    if sub.empty?
                        result.push(word)
                    else
                        result.push("#{word} #{sub}")
                    end
                end
            end
        end
    end
    cache[input] = result
    result
end

puts word_break(input, dict)
