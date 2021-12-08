require 'byebug'

answers = {
  abcefg: '0',
  cf: '1',
  acdeg: '2',
  acdfg: '3',
  bcdf: '4',
  abdfg: '5',
  abdefg: '6',
  acf: '7',
  abcdefg: '8',
  abcdfg: '9'
}

files = ['./08/test_data.txt']
files = ['./08/test_data.txt', './08/data.txt']

def decode_input(input)
  input = input.split(' ').sort_by(&:length)
  decrypt_key = {
    a: '',
    b: '',
    c: '',
    d: '',
    e: '',
    f: '',
    g: ''
  }
  two_key = ''
  three_key = ''
  four_key = ''
  five_keys = []
  six_keys = []

  input.each do |x|
    if x.length == 2
      two_key = x
    elsif x.length == 3
      three_key = x
    elsif x.length == 4
      four_key = x
    elsif x.length == 5
      five_keys << x.chars
    elsif x.length == 6
      six_keys << x.chars
    end
  end
  decrypt_key[:a] = (three_key.chars - two_key.chars)[0]
  horizontals = five_keys[0] & five_keys[1] & five_keys[2]
  decrypt_key[:d] = (horizontals & four_key.chars)[0]
  decrypt_key[:g] = (horizontals - [decrypt_key[:a], decrypt_key[:d]])[0]
  decrypt_key[:b] = (four_key.chars - two_key.chars - horizontals)[0]
  decrypt_key[:f] = (six_keys[0] & six_keys[1] & six_keys[2] - horizontals - [decrypt_key[:b]])[0]
  decrypt_key[:c] = (two_key.chars - [decrypt_key[:f]])[0]
  decrypt_key[:e] = ('abcdefg'.chars - decrypt_key.values)[0]
  
  decrypt_key
end

files.each do |file_name|
  file = File.open(file_name)
  d = file.read.split("\n")

  # VARIABLES
  decoded_output = []
  d.each do |row|
    row_output = []
    input = row.split(' | ')[0]
    decrypt_key = decode_input(input).invert
    output = row.split(' | ')[1]
    output.split(' ').each do |x|
      y = x.chars.map { |ch| decrypt_key[ch].to_s }
      row_output << answers[y.sort.join.to_sym]
    end
    decoded_output << row_output.join.to_i
    p row_output.join.to_i
  end

  p decoded_output.sum
end