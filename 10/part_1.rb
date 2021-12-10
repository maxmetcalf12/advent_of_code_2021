require 'byebug'

files = ['./10/test_data.txt']
files = ['./10/test_data.txt', './10/data.txt']

pars = {
  ')': '(',
  ']': '[',
  '}': '{',
  '>': '<',
}

error_vals = {
  ')': 3,
  ']': 57,
  '}': 1197,
  '>': 25137,
}

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n").map{ |row| row.chars }
  
  # VARIABLES
  stack = []
  errors = 0

  d.each do |row|
    row.each do |x|
      if pars.values.include?(x)
        stack << x
      else
        errors += error_vals[x.to_sym] if stack.pop != pars[x.to_sym]
      end
    end
  end

  p errors
end