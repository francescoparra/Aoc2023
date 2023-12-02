# frozen_string_literal: true

values = File.readlines('input', chomp: true)

result = 0

values.each do |val|
  game_id = val[/\d+/]
  val = val.sub!("Game #{game_id}: ", '')
  val = val.split(/[,;]/)
  numbers = {
    'red' => [],
    'blue' => [],
    'green' => []
  }
  val.each do |v|
    block_number = v.gsub(/[^0-9]/, '')
    numbers[v.gsub(/^[\s\d]+/, '')].push(block_number.to_i)
  end
  max_red = numbers['red'].max
  max_blue = numbers['blue'].max
  max_green = numbers['green'].max
  result += max_red * max_green * max_blue
end
pp result
