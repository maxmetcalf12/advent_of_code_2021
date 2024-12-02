# frozen_string_literal: true

require 'byebug'
f = File.open('./data.txt')

data = f.read.split("\n")
