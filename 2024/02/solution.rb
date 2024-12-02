# frozen_string_literal: true

require 'byebug'
f = File.open('./data.txt')

def is_safe?(row)
  return false unless row == row.sort || row.reverse == row.sort

  row.each_with_index do |val, index|
    next if index == row.length - 1
    return false if (val - row[index + 1]).abs > 3 || (val - row[index + 1]).abs == 0
  end
  true
end

def is_safe_2?(row)
  return true if is_safe?(row)

  row.each_with_index do |_val, index|
    new_row = row.dup
    new_row.delete_at(index)
    return true if is_safe?(new_row)
  end

  false
end

data = f.read.split("\n")
rows = data.map { |row| row.split.map(&:to_i) }
ordered_rows = rows.filter { |row| is_safe?(row) }

puts ordered_rows.length

# Part 2
ordered_rows = rows.filter { |row| is_safe_2?(row) }

puts ordered_rows.length
