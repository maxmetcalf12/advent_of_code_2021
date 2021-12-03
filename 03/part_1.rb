files = ['./03/test_data.txt', './03/data.txt']

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")

  # VARIABLES
  gamma = []
  eps = []

  ones = []
  zeros = []

  # LOOP THROUGH DATA
  d.each_with_index do |row, i|
    (0...row.length).each do |num|
      ones[num] ||= 0
      zeros[num] ||= 0

      ones[num] += 1 if row[num] == '1'
      zeros[num] += 1 if row[num] == '0'
    end
  end

  (0...ones.length).each do |i|
    gamma[i] = ones[i] >= zeros[i] ? '1' : '0'
    eps[i] = ones[i] < zeros[i] ? '1' : '0'
  end
  

  # PRINT RESULT
  p gamma.join('').to_i(2) * eps.join('').to_i(2)
end
