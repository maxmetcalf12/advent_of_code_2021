require 'byebug'
require 'set'


files = ['./05/test_data.txt']
files = ['./05/test_data.txt', './05/data.txt']

class Line
  attr_accessor :x1
  attr_accessor :x2
  attr_accessor :y1
  attr_accessor :y2
  attr_accessor :all_points

  def initialize(data)
    @x1 = data[0].split(',')[0].to_i
    @x2 = data[1].split(',')[0].to_i
    @y1 = data[0].split(',')[1].to_i
    @y2 = data[1].split(',')[1].to_i
    @all_points = set_all_points
  end

  def pretty
    p "#{x1}, #{y1} -- #{x2}, #{y2}"
  end

  def is_straight?
    x1 == x2 || y1 == y2
  end

  def set_all_points
    points = Set.new
    points << [x1, y1].join(',')
    points << [x2, y2].join(',')
    if x1 == x2
      ([y1, y2].min..[y1, y2].max).each do |y|
        points.add([x1, y].join(','))
      end
    elsif y1 == y2
      ([x1, x2].min..[x1, x2].max).each do |x|
        points.add([x, y1].join(','))
      end
    else
      ([x1, x2].min..[x1, x2].max).each_with_index do |x, i|
        if [x1, x2].min == x1
          points.add([x, y1 + i].join(',')) if ((y2 - y1) / (x2 - x1)) > 0
          points.add([x, y1 - i].join(',')) if ((y2 - y1) / (x2 - x1)) < 0
        else
          points.add([x, y2 + i].join(',')) if ((y2 - y1) / (x2 - x1)) > 0
          points.add([x, y2 - i].join(',')) if ((y2 - y1) / (x2 - x1)) < 0
        end
      end
    end
    points.to_a
  end
end

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n").map{ |row| row.split(' -> ')}

  lines = []
  max_x = 0
  max_y = 0

  points = {}

  d.each do |line|
    new_line = Line.new(line)

    new_line.all_points.each do |point|
      points[point] ||= 0
      points[point] += 1
    end
  end

  p points.select {|k, v| v > 1}.keys.length
end