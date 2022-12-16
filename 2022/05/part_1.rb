require 'byebug'

files = [
  './test_data.txt',
  './data.txt'
]

def process_move(move, crate_rows)
  num_to_move = move.split(' ')[1].to_i
  starting_col = move.split(' ')[3].to_i - 1
  ending_col = move.split(' ')[5].to_i - 1
  (0...num_to_move).each do |x|
    crate_rows[ending_col].push(crate_rows[starting_col].pop)
  end
  crate_rows
end

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")

  points = 0
  crate_row_count = []
  crate_row_index = 0
  d.each_with_index do |row, index|
    if row.include?('1')
      crate_row_count = row.strip.split('   ').size
      crate_row_index = index
      break
    end
  end

  crate_rows = (0...crate_row_count).to_a.map { |a| [] }

  (0...crate_row_index).reverse_each do |idx|
    d[idx].chars.each_slice(4).to_a.each_with_index do |row, row_idx|
      crate_rows[row_idx].push(row[1]) if row[0..2].join('').strip.length > 0
    end
  end
  
  ((crate_row_index + 2) ... d.length).each do |i|
    crate_rows = process_move(d[i], crate_rows)
  end

  puts crate_rows.map{ |row| row.pop }.join('')
end