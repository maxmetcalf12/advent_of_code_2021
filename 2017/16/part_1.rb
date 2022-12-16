require 'byebug'
require 'set'

files = ['./data.txt']

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split(",")

  list = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p']

  def s_mv(mv, temp_list)
    temp_list[(temp_list.size - mv.to_i)..].concat(temp_list[0...(temp_list.size - mv.to_i)])
  end

  def x_mv(mv, temp_list)
    pair_1, pair_2 = mv.split('/').map(&:to_i)
    temp = temp_list[pair_2]
    temp_list[pair_2] = temp_list[pair_1]
    temp_list[pair_1] = temp
    temp_list
  end

  def p_mv(mv, temp_list)
    temp_1, temp_2 = mv.split('/')
    pair_1 = temp_list.find_index(temp_1)
    pair_2 = temp_list.find_index(temp_2)
    temp = temp_list[pair_2]
    temp_list[pair_2] = temp_list[pair_1]
    temp_list[pair_1] = temp
    temp_list
  end

  d.each do |mv|
    if mv[0] == 's'
      list = s_mv(mv[1..], list)
    elsif mv[0] == 'x'
      list = x_mv(mv[1..], list)
    elsif mv[0] == 'p'
      list = p_mv(mv[1..], list)
    end
  end
  puts list.join('')
end