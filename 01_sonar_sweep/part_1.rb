f = File.open("./01_sonar_sweep/data.txt")

depths = f.read.split("\n").map(&:to_i)

count = 0

depths.each_with_index do |depth, i|
  p depth
  next if i == 0

  count += 1 if depth > depths[i-1]
end

p count