require 'byebug'

files = [
  './test_data.txt',
  './data.txt'
]

def score_game(game)
  results = {
    'A' => 'rock',
    'B' => 'paper',
    'C' => 'scissors',
    'X' => 'lose',
    'Y' => 'draw',
    'Z' => 'win',
  }
  points = {
    'rock' => 1,
    'paper' => 2,
    'scissors' => 3
  }
  x, y = game.split(' ')


  if results[y] == 'draw'
    return 3 + points[results[x]]
  elsif results[y] == 'win'
    if results[x] == 'rock'
      return 6 + 2
    elsif results[x] == 'paper'
      return 6 + 3
    else
      return 6 + 1
    end
  else
    if results[x] == 'rock'
      return 3
    elsif results[x] == 'paper'
      return 1
    else
      return 2
    end
  end
end

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")

  points = 0
  d.each do |game|
    points += score_game(game)
  end

  puts points
end