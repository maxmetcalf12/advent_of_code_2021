f = File.open("./01_sonar_sweep/data.txt")

depths = f.read.split("\n").map(&:to_i)

count = 0

depths.each_with_index do |depth, i|
  next if i == 0 || i >= depths.length - 2

  count += 1 if (depths[i] + depths[i+1] + depths[i+2]) > (depths[i-1] + depths[i] + depths[i+1])
end

p count