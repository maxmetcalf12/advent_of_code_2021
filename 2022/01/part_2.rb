require 'byebug'
f = File.open("./data.txt")

vals = f.read.split("\n").map(&:to_i)
elf_diets = vals.chunk {|x| x != 0 || nil}.map(&:last)
diet_values = elf_diets.map { |x| x.sum }

p diet_values.sort.last(3).sum
