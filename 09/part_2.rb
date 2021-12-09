require 'byebug'

files = ['./09/test_data.txt']
# files = ['./09/test_data.txt', './09/data.txt']

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")

  # VARIABLES
  occ = 0
  d.each do |row|
    output = row.split(' | ')[1]
    output.split(' ').each do |x|
      occ += 1 if [2, 3, 4, 7].include?(x.length)
    end
  end

  p occ
end