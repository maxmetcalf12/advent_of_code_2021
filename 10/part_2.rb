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

def add_to_score(score, par)
  if par == '['
    return score * 5 + 2
  elsif par == '('
    return score * 5 + 1
  elsif par == '{'
    return score * 5 + 3
  else
    return score * 5 + 4
  end
end

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n").map{ |row| row.chars }
  
  # VARIABLES
  scores = []
  
  d.each do |row|
    score = 0
    stack = []
    begin
      row.each do |x|
        if pars.values.include?(x)
          stack << x
        else
          if stack.pop != pars[x.to_sym]
            stack = []
            raise
          end
        end
      end
      stack = []
      row.each do |x|
        if pars.values.include?(x)
          stack << x
        else
          stack.pop
        end
      end
      stack.reverse_each do |x|
        score = add_to_score(score, x)
      end
      scores << score
    rescue
      p "CORRUPT"
    end
  end

  scores.sort!
  p (scores[(scores.length - 1) / 2] + scores[scores.length / 2]) / 2.0
end