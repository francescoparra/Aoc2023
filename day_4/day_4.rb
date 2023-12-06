# frozen_string_literal: true

values = File.readlines('add_your_input', chomp: true)

total_points = 0
total_scratchcards = 0
hash = { 0 => 1 }

values.each.with_index do |val, i|
  val = (val.sub(/.*:/, '')).split(' | ')
  winning_numbers = val[0].split.reject(&:empty?).map(&:to_i)
  card_numbers = val[1].split.reject(&:empty?).map(&:to_i)

  card_points = 0

  card_numbers.each do |cn|
    card_points = card_points.zero? ? 1 : card_points * 2 if winning_numbers.include?(cn)
  end

  total_points += card_points

  (hash[i] || 1).times do
    total_scratchcards += 1
    x = 0
    card_numbers.each do |cn|
      next unless winning_numbers.include?(cn)

      x += 1
      scratchcard_number = i + x
      if hash[i + x].nil?
        hash[scratchcard_number] = 2
      else
        hash[scratchcard_number] += 1
      end
    end
  end
end

pp "Total Points: #{total_points}"
pp "Total Scratchcards: #{total_scratchcards}"
