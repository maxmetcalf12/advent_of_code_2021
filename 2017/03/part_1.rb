require 'byebug'

x = 368078

layer_width = (Math.sqrt(x)).ceil

layer_width = layer_width % 2 == 0 ? layer_width + 1 : layer_width

largest_corner = (layer_width)**2

all_centers = [
  largest_corner - (layer_width / 2).floor,
  largest_corner - (layer_width - 1)  - (layer_width / 2).floor,
  largest_corner - 2*(layer_width - 1) - (layer_width / 2).floor,
  largest_corner - 3*(layer_width - 1) - (layer_width / 2).floor,
]

horizontal_steps = all_centers.map { |center| (x - center).abs }.min

vertical_steps = (layer_width / 2).floor

total_steps = vertical_steps + horizontal_steps

puts total_steps