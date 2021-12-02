files = ['./03/test_data.txt', './03/data.txt']

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")

  # VARIABLES
  foo = 0
  bar = 0

  # LOOP THROUGH DATA
  d.each_with_index do |row, i|
    
  end

  # PRINT RESULT
  p foo
end
