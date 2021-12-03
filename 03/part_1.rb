files = ['./03/test_data.txt', './03/data.txt']

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")

  # VARIABLES
  gamma = []
  eps = []

  # LOOP THROUGH DATA
  (0...d[0].length).each do |i|
    ones = d.select{ |row| row[i] == '1'}.length
    zeros = d.select{ |row| row[i] == '0'}.length

    if ones >= zeros
      gamma << '1'
      eps << '0'
    else
      gamma << '0'
      eps << '1'
    end
  end

  # PRINT RESULT
  p gamma.join('').to_i(2) * eps.join('').to_i(2)
end
