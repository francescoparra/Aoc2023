# frozen_string_literal: true

values = File.readlines('/home/fp/Desktop/Aoc2023/day_2/input', chomp: true)

sum = 0

color_to_max_hash =
  {
    'red' => 12,
    'green' => 13,
    'blue' => 14
  }

values.each do |val|
  game_id = val[/\d+/]
  val = val.sub!("Game #{game_id}: ", '')
  val = val.split(/[,;]/)
  impossible = false
  val.each do |v|
    block_number = v.gsub(/[^0-9]/, '')
    if block_number.to_i > color_to_max_hash[v.gsub(/^[\s\d]+/, '')]
      impossible = true
      break
    end
  end
  sum += game_id.to_i unless impossible
end
pp sum
