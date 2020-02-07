require "benchmark"

def find_count_of_islands(sea)
  count = 0
  sea.each_with_index do |_v, i|
    sea[i].each_with_index do |inner, j|
      if inner == 1
        search_for_island(i, j, sea)
        count += 1
      end
    end
  end
  count
end

def search_for_island(i, j, sea)
  return if invalid(i, j, sea)
  sea[i][j] = 0
  spawn { search_for_island(i, j - 1, sea) }
  spawn { search_for_island(i, j + 1, sea) }
  spawn { search_for_island(i - 1, j, sea) }
  spawn { search_for_island(i + 1, j, sea) }
end

def invalid(i, j, sea)
  return true if i < 0
  return true if j < 0
  return true if i > (sea.size - 1)
  return true if j > (sea[0].size - 1)
  return true unless sea[i][j] == 1
  false
end

sea = [
  [0,0,1,1,1],
  [1,1,1,0,0],
  [0,0,0,0,1],
  [1,1,0,0,0],
  [1,1,1,0,1]
]

count = ""
puts Benchmark.measure { count = "Count: #{find_count_of_islands(sea)}" }
puts count
