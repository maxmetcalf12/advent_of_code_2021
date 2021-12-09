require 'byebug'

files = ['./09/test_data.txt']
files = ['./09/test_data.txt', './09/data.txt']

def check_valid(grid, i, j)
  i < 0 || j < 0 || i >= grid.length || j >= grid[0].length 
end

def explore(grid, i, j, x)
  return x if check_valid(grid, i, j) || grid[i][j] == "X" || grid[i][j] == "9"
  x += 1
  grid[i][j] = "X"
  x = explore(grid, i+1, j, x)
  x = explore(grid, i-1, j, x)
  x = explore(grid, i, j+1, x)
  x = explore(grid, i, j-1, x)
end

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n").map{ |row| row.chars }
  
  # VARIABLES
  lows = []

  (0...d.length).each do |i|
    (0...d[0].length).each do |j|
      left = j != 0 ? d[i][j-1] : nil
      right = j != d[0].length - 1 ? d[i][j+1] : nil
      down = i != 0 ? d[i-1][j] : nil
      up = i != d.length - 1 ? d[i+1][j] : nil
      
      if [left, right, up, down].compact.min > d[i][j]
        lows << [i, j]
      end
    end
  end

  sizes = []

  lows.each do |low|
    x = 0
    sizes << explore(d, low[0], low[1], x)
  end

  p sizes.sort.last(3).inject(:*)
end