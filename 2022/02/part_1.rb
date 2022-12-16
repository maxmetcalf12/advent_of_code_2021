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
    'X' => 'rock',
    'Y' => 'paper',
    'Z' => 'scissors',
  }
  points = {
    'rock' => 1,
    'paper' => 2,
    'scissors' => 3
  }
  x, y = game.split(' ')

  score = 0

  if results[x] == results[y]
    score += 3
  elsif results[x] == 'rock'
    if results[y] == 'paper'
      score += 6
    end
  elsif results[x] == 'paper'
    if results[y] == 'scissors'
      score += 6
    end
  elsif results[x] == 'scissors'
    if results[y] == 'rock'
      score += 6
    end
  end

  score + points[results[y]]
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