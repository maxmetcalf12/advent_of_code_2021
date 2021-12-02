f = File.open("./02/data.txt")

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
