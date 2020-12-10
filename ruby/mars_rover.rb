# 5 5
# 1 2 N
# LMLMLMLMM
# 3 3 E
# MMRMMRMRRM

# Expected Output:
# 1 3 N
# 5 1 E
require "pry"
def traverse_plateau(limit, rover_positions_and_instructions)
  rover_positions_and_instructions.each do |position, instructions|
    current_direction = position.chars.last
    current_position = position.split(" ")[0..1].map! { |elem| elem.to_i }
    orientations = {
      'N': {
        'L': 'W', 
        'R': 'E'
      },
      'S': {
        'L': 'E',
        'R': 'W',
      },
      'E': {
        'L': 'N',
        'R': 'S',
      },
      'W': {
        'L': 'S',
        'R': 'N'
      }
    }
    instructions.chars.each do |instruction|
      if ['L', 'R'].include?(instruction) 
        current_direction = orientations[current_direction.to_sym][instruction.to_sym]
      end
      
      if instruction == 'M'
        current_position = move_laterally(current_direction, current_position, limit)
        current_position = move_up_or_down(current_direction, current_position, limit)
      end
    end
    puts "#{current_position} #{current_direction}"
  end
end

private def move_laterally(direction, current_position, boundary)
  return current_position if current_position[0] + 1 > boundary[0] || current_position[0] - 1 < 0
  if direction == 'E'
    return [current_position[0] + 1, current_position[1]]
  end

  if direction == 'W'
    return [current_position[0] - 1, current_position[1]]
  end
  current_position
end

private def move_up_or_down(direction, current_position, boundary)
  return current_position if current_position[1] + 1 > boundary[1] || current_position[1] - 1 < 0

  if direction == 'N'
    return [current_position[0], current_position[1] + 1]
  end

  if direction == 'S'
    return [current_position[0], current_position[1] - 1]
  end
  current_position
end

traverse_plateau([5, 5], [['1 2 N', 'LMLMLMLMM'], ['3 3 E', 'MMRMMRMRRM']])
