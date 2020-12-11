def distance_to_goal(start, goal, obstacles)
  queue = [start]
  visited = [start]
  jumps = 0
  until queue.empty?
    frontier = queue
    queue = []
    until frontier.empty?
      current = frontier.shift
      return jumps if goal == current

      neighbours = get_neighbours(current)
      neighbours.reject! { |neighbour| obstacles.include?(neighbour) }
      neighbours.reject! { |neighbour| visited.include?(neighbour) }
      queue.push(*neighbours)
      visited.push(*neighbours)
    end
    jumps += 1
  end
  raise Error.new('Unreachable Goal')
end

def get_neighbours(position)
  neighbours = []
  neighbours << [position[0] - 2, position[1] + 1]
  neighbours << [position[0] - 1, position[1] + 2]
  neighbours << [position[0] + 1, position[1] + 2]
  neighbours << [position[0] + 2, position[1] + 1]
  neighbours << [position[0] - 2, position[1] - 1]
  neighbours << [position[0] - 1, position[1] - 2]
  neighbours << [position[0] + 1, position[1] - 2]
  neighbours << [position[0] + 2, position[1] - 1]
end

board = Array.new { 8.times { |x| 8.times { |y| [x, y] } } }
obstacles = [[1, 5], [2, 3], [8,0], [1,1]]
start = [4, 4]
goal = [9, 10]
puts distance_to_goal(start, goal, obstacles)
