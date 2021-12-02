files = ['./02/test_data.txt', './02/data.txt']

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")

  # VARIABLES
  dep = 0
  hor = 0

  # LOOP THROUGH DATA
  d.each_with_index do |row, i|
    dir, dist = row.split(' ')
    case dir
    when 'forward'
      hor += dist.to_i
    when 'down'
      dep += dist.to_i
    when 'up'
      dep -= dist.to_i
    end
  end

  # PRINT RESULT
  p dep * hor
end
