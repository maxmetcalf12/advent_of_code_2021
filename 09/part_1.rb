require 'byebug'

files = ['./09/test_data.txt']
files = ['./09/test_data.txt', './09/data.txt']

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n").map{ |row| row.chars }
  
  # VARIABLES
  lows = 0

  (0...d.length).each do |i|
    (0...d[0].length).each do |j|
      left = j != 0 ? d[i][j-1] : nil
      right = j != d[0].length - 1 ? d[i][j+1] : nil
      down = i != 0 ? d[i-1][j] : nil
      up = i != d.length - 1 ? d[i+1][j] : nil
      
      if [left, right, up, down].compact.min > d[i][j]
        lows += d[i][j].to_i + 1
      end
    end
  end

  p lows
end