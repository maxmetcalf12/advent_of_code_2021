require 'byebug'

files = [
  './test_data.txt',
  './data.txt'
]

def find_extra(sack)
  sack_1, sack_2 = sack.chars.each_slice(sack.size/2).map(&:to_a)
  sack_1 & sack_2
end

def point_char(char)
  if ((97..122).include?(char.ord))
    char.ord - 96
  else
    char.ord - 38
  end
end

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")

  points = 0
  d.each do |sack|
    extra_item = find_extra(sack)[0]
    points += point_char(extra_item)
  end

  puts points
end