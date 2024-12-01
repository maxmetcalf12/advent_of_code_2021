# frozen_string_literal: true

require 'byebug'
f = File.open('./data.txt')

data = f.read.split("\n")
a = data.map(&:split).map(&:first).map(&:to_i).sort
b = data.map(&:split).map(&:last).map(&:to_i).sort
# Equivalent to below using transpose
# a, b = data.map(&:split).transpose.map { |x| x.map(&:to_i).sort }

# PART 1
diff = a.zip(b).map { |x, y| (x - y).abs }
puts diff.sum

# PART 2
counts = a.map { |x| x * b.filter { |y| y == x }.count }
puts counts.sum
