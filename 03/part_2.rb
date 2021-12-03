files = ['./03/test_data.txt', './03/data.txt']

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")

  # VARIABLES
  oxy = []

  # LOOP THROUGH DATA\
  oxy_rows = d
  (0...d[0].length).each do |i|
    ones = oxy_rows.select{ |row| row[i] == '1'}.length
    zeros = oxy_rows.select{ |row| row[i] == '0'}.length

    if ones >= zeros
      oxy_rows = oxy_rows.select { |row| row[i] == '1' }
      oxy << '1'
    else
      oxy_rows = oxy_rows.select { |row| row[i] == '0' }
      oxy << '0'
    end
  end

  co2_rows = d
  (0...d[0].length).each do |i|
    ones = co2_rows.select{ |row| row[i] == '1'}.length
    zeros = co2_rows.select{ |row| row[i] == '0'}.length

    if ones < zeros
      co2_rows = co2_rows.select { |row| row[i] == '1' }
    else
      co2_rows = co2_rows.select { |row| row[i] == '0' }
    end

    break if co2_rows.length == 1
  end

  # PRINT RESULT
  p oxy.join('').to_i(2) * co2_rows[0].to_i(2)
end
