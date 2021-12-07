require 'byebug'
require 'set'

files = ['./06/test_data.txt']
files = ['./06/test_data.txt', './06/data.txt']

def inc_day(fishes)
  new_fishes = {}
  new_fishes['8'] = fishes['0'] || 0
  new_fishes['7'] = fishes['8'] || 0
  new_fishes['6'] = (fishes['7'] || 0) + (fishes['0'] || 0)
  new_fishes['5'] = fishes['6'] || 0
  new_fishes['4'] = fishes['5'] || 0
  new_fishes['3'] = fishes['4'] || 0
  new_fishes['2'] = fishes['3'] || 0
  new_fishes['1'] = fishes['2'] || 0
  new_fishes['0'] = fishes['1'] || 0

  new_fishes
end

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n").map{ |row| row.split(',')}

  fishes = {}

  d[0].each do |fish|
    fishes[fish] ||= 0
    fishes[fish] += 1
  end

  (1..80).each do |i|
    fishes = inc_day(fishes)
  end

  p fishes.values.sum
end