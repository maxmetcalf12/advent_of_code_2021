require 'byebug'

files = ['./04/test_data.txt']
# files = ['./04/test_data.txt', './04/data.txt']

class Board
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def mark_number(number)
    @grid = grid.map do |row|
      row = row.map{ |x| x == number ? 'X' : x }
    end

    grid
  end

  def check_for_bingo
    grid.each_with_index do |row, i|
      bingo = row.all? { |col| col == 'X' }
      return ["ROW", i] if bingo
    end

    (0..grid.length).each do |col|
      bingo = grid.all? { |row| row[col] == 'X' }
      return ["COL", col] if bingo
    end

    false
  end
end


files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")

  # VARIABLES
  numbers = d[0].split(',')
  number_of_boards = d.length / 6
  boards = []
  orig_boards = []

  (0...number_of_boards).each do |i|
    boards << Board.new(d[i*6+2..i*6+6].map { |x| x.split(' ') })
    orig_boards << d[i*6+2..i*6+6].map { |x| x.split(' ') }
  end


  numbers.each do |i|
    boards.each_with_index do |board, j|
      board.mark_number(i)
      if board.check_for_bingo
        p board.check_for_bingo
        p orig_boards[j][board.check_for_bingo[1]]
        raise
      end
    end
  end
end