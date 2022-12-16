require 'byebug'

given = 368078

layer_width = (Math.sqrt(given)).ceil

layer_width = layer_width % 2 == 0 ? layer_width + 1 : layer_width

def initialize_board(n, val)
  board = Array.new(n)
  n.times do |row_index|
    board[row_index] = Array.new(n)
    n.times do |column_index|
      board[row_index][column_index] = val
    end
  end
  board
end

grid = initialize_board(layer_width, 0)

def calc_var(grid, col, row, given_x)
  abc = [
    grid[col + 1][row - 1],
    grid[col + 1][row],
    grid[col + 1][row + 1],
    grid[col][row - 1],
    grid[col][row + 1],
    grid[col - 1][row - 1],
    grid[col - 1][row],
    grid[col - 1][row + 1],
  ].sum

  puts abc if abc > given_x
  abc
end

x = (layer_width / 2).floor
grid[x][x] = 1

z = 1
while true do
  break if z > 10
  col_s = x - (z - 1)
  (0..(2*z-1)).each do |up|
    grid[col_s + up][x + z] = calc_var(grid, col_s + up, x+z, given)
  end
  (0..(2*z)).each do |left|
    grid[col_s + (2*z - 1)][x + z - left] = calc_var(grid, col_s + (2*z - 1), x+z-left, given)
  end
  (0..(2*z)).each do |down|
    grid[col_s + (2*z - 1) - down][x - z] = calc_var(grid, col_s + (2*z - 1) - down, x - z, given)
  end
  (0..(2*z)).each do |right|
    grid[col_s + (2*z - 1) - 2*z][x - z + right] = calc_var(grid, col_s + (2*z - 1) - 2*z, x - z + right, given)
  end
  z += 1
end

puts "FINISHED"