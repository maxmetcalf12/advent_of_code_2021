require 'byebug'

files = [
  './test_data.txt',
  './data.txt'
]

def find_common(sack_group)
  sack_group[0].chars & sack_group[1].chars & sack_group[2].chars
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
  d.each_slice(3) do |sack_group|
    extra_item = find_common(sack_group)[0]
    points += point_char(extra_item)
  end

  puts points
end