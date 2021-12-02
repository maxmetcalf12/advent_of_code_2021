files = ['./02/test_data.txt', './02/data.txt']

files.each do |file_name|
  f = File.open(file_name)

  data = f.read.split("\n")
  horizontal = 0
  vertical = 0
  (0...data.length).each do |i|
    direction, amount = data[i].split(' ')
    if direction == 'forward'
      horizontal += amount.to_i
    elsif direction == 'down'
      vertical += amount.to_i
    elsif direction == 'up'
      vertical -= amount.to_i
    end
  end

  p horizontal * vertical
end
