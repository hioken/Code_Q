def gets_i_array
  gets.split(' ').map(&:to_i)
end

y_line, x_line, digit = gets_i_array
number_map = []
y_line.times { number_map << gets.chomp.chars }
results = []

if digit == 1
  number_map.map! do |line|
    line.map(&:to_i)
  end
  max_num = number_map.flatten.max
else
  max_scope_y, max_scope_x = (number_map.size - digit), (number_map[0].size - digit)
  candidates = []

  if max_scope_y > 0
    x_line.times do |x|
      (max_scope_y + 1).times do |y|
        candidates << number_map[y..(y + digit - 1)].inject('') { |ret, line| ret + line[x]}.to_i
      end
    end
  end

  if max_scope_x > 0
    number_map.each do |line|
      (max_scope_x + 1).times do |x|
        candidates << line[x..(x + digit - 1)].join.to_i
      end
    end
  end
  max_num = candidates.max
end

puts max_num
