files = ['./03/test_data.txt', './03/data.txt']
# files = ['./03/test_data.txt']

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

  rows = d
  oxy = []
  co2 = []
  skipped_indices = []
  (0...ones.length).each do |i|
    x = 0
    y = 0
    d.each_with_index do |row, j|
      next if skipped_indices.include?(j)
      x += 1 if row[i] == '1'
      y += 1 if row[i] == '0'
    end
    d.each_with_index do |row, j|
      next if skipped_indices.include?(j)
      if x >= y
        skipped_indices << j if row[i] == '0'
      else
        skipped_indices << j if row[i] == '1'
      end
    end
    if x >= y
      oxy << '1'
    else
      oxy << '0'
    end
  end

  skipped_indices = []
  (0...ones.length).each do |i|
    break if skipped_indices.length >= d.length - 1
    x = 0
    y = 0
    d.each_with_index do |row, j|
      next if skipped_indices.include?(j)
      x += 1 if row[i] == '1'
      y += 1 if row[i] == '0'
    end
    d.each_with_index do |row, j|
      next if skipped_indices.include?(j)
      if x < y
        skipped_indices << j if row[i] == '0'
      else
        skipped_indices << j if row[i] == '1'
      end
    end
  end
  remaining = (0...d.length).to_a - skipped_indices

  # PRINT RESULT
  p d[remaining[0]].to_i(2) * oxy.join('').to_i(2)
end
