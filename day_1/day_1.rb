# frozen_string_literal: true

values = File.readlines('input', chomp: true)
sum = 0
str_to_int_hash =
  {
    'zero' => 0,
    'one' => 1,
    'two' => 2,
    'three' => 3,
    'four' => 4,
    'five' => 5,
    'six' => 6,
    'seven' => 7,
    'eight' => 8,
    'nine' => 9
  }
values.each do |val|
  str_to_int_hash.each do |k, v|
    val = val.gsub(k, v.to_s)
  end
  str_to_int_hash.each do |k, v|
    val = val.gsub(k[1..-1], v.to_s)
  end
  str_to_int_hash.each do |k, v|
    val = val.gsub(k[0..-2], v.to_s)
  end
  val = val.tr('^0-9', '')
  if val[1].nil?
    val = (val + val).to_i
    sum += val
  elsif !val[2].nil?
    val = (val[0] + val[-1]).to_i
    sum += val
  else
    sum += val.to_i
  end
end
pp sum
