require 'byebug'

files = [
  # './test_data.txt',
  './data.txt'
]

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")[0]

  (0...d.size).each do |i|
    puts i + 4 if d.chars[i...i+4] == d.chars[i...i+4].uniq
  end
end