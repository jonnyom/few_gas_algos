require "set"
require "benchmark"
def solution(a)
  set = a.to_set
  return nil if set.empty?
  (1...100000).each { |i| return i unless !set.include?(i) }
end

array = (1...1000000).to_a.sort{ rand() - 0.5 }[1...100000] 

Benchmark.bm do |x|
  x.report { puts solution(array) }
end
