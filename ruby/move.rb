board = [
  [1, 2, 3],
  [1, 0, 2],
  [1, 2 ,3]
]

def move(board, i, j)
  return board if i >= board.length || j >= board[0].length
  return board if board[i][j] == 0

  (0...board.length).each do |x|
    (0...board.length).each do |y|
      if board[x][y] == 0
        swap(board, i, j, x, y) if valid_move?(board, i, j, x, y)
      end
    end
  end
  board
end

def valid_move?(board, i, j, proposed_i, proposed_j)
  return false if i + 1 == proposed_i && j + 1 == proposed_j
  return false if i - 1 == proposed_i && j - 1 == proposed_j
  return false if i - 1 == proposed_i && j + 1 == proposed_j
  return false if i + 1 == proposed_i && j - 1 == proposed_j
  true
end

def swap(board, i, j, x, y)
  temp = board[i][j]
  board[i][j] = board[x][y]
  board[x][y] = temp
  board
end

pp "1: #{move(board, 0, 1)}"
pp "2: #{move(board, 1, 1)}"
pp "3: #{move(board, 0, 0)}"
pp "4: #{move(board, 2, 2)}"
pp "5: #{move(board, 2, 0)}"
pp "6: #{move(board, 2, 3)}"
