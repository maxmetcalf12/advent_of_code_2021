require 'byebug'

files = ['./07/test_data.txt']
files = ['./07/test_data.txt', './07/data.txt']

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")

  # VARIABLES
  crabs = d[0].split(',').map{ |x| x.to_i }
  min_total = Float::INFINITY
  
  (crabs.min..crabs.max).each do |x|
    total = crabs.map { |y| (y - x).abs }
    min_total = [min_total, total.sum].min
  end

  p min_total
end