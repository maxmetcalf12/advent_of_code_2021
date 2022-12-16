require 'byebug'
require 'set'

files = [
  './test_data.txt',
  './data.txt'
]

def full_overlap(a, b)
  a1, a2 = a.split('-').map(&:to_i)
  a_group = Set.new((a1..a2).to_a)
  b1, b2 = b.split('-').map(&:to_i)
  b_group = Set.new((b1..b2).to_a)
  a_group.subset?(b_group) || b_group.subset?(a_group)
end

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")

  points = 0
  d.each do |sack|
    a, b = sack.split(',')
    points += 1 if full_overlap(a,b)
  end

  puts points
end