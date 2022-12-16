require 'byebug'

files = [
  # './test_data.txt',
  './data.txt'
]

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")[0]

  (0...d.size).each do |i|
    puts i + 14 if d.chars[i...i+14] == d.chars[i...i+14].uniq
  end
end