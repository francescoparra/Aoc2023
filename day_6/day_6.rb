# frozen_string_literal: true

values = File.readlines('add_your_input', chomp: true)

time = (values[0].sub(/.*:/, '')).split.map(&:to_i)
distance = (values[1].sub(/.*:/, '')).split.map(&:to_i)
time_pt2 = time.join.to_i
distance_pt2 = distance.join.to_i
prod = 1
sum = 0

time.each.with_index do |t, i|
  d = distance[i]
  holding_millisecond = 0
  win_times = 0
  t.times do
    holding_millisecond += 1
    remaining_time = t - holding_millisecond
    speed = holding_millisecond * remaining_time
    win_times += 1 if holding_millisecond <= t && speed > d
  end
  prod *= win_times
end

holding_millisecond = 0
time_pt2.times do
  holding_millisecond += 1
  remaining_time = time_pt2 - holding_millisecond
  speed = holding_millisecond * remaining_time
  sum += 1 if holding_millisecond <= time_pt2 && speed > distance_pt2
end

pp "Part 1: #{prod}"
pp "Part 2: #{sum}"
