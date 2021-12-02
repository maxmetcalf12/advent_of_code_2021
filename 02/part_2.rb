f = File.open("./02/data.txt")

data = f.read.split("\n")
horizontal = 0
vertical = 0
aim = 0
(0...data.length).each do |i|
  direction, amount = data[i].split(' ')
  if direction == 'forward'
    horizontal += amount.to_i
    vertical += amount.to_i * aim
  elsif direction == 'down'
    aim += amount.to_i
  elsif direction == 'up'
    aim -= amount.to_i
  end
end

p horizontal * vertical
