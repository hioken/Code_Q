def gets_i_array
  gets.split(' ').map(&:to_i)
end

y_line, x_line, digit = gets_i_array
number_map = []
y_line.times { number_map << gets.chomp.chars.map(&:to_i) }
results = []

if digit == 1
  max_num = number_map.flatten.max
else
  max_scope_y, max_scope_x = (number_map.size - digit), (number_map[0].size - digit)
  f_max_num = 0

  number_map.each_with_index do |x_line, y|
    x_line.each_with_index do |num, x|
      if num > f_max_num && (y < max_scope_y || x < max_scope_x)
        f_max_num = num
      end
    end
  end

  points = []
  number_map.each_with_index do |x_line, y|
    x_line.each_with_index do |num, x|
      points << [y, x] if num == f_max_num
    end
  end

  candidates = []
  points.each do |point|
    y = point[0]
    x = point[1]
    if x <= max_scope_x
      x_scope = x + digit - 1
      candidates << number_map[y][x..x_scope].join.to_i
    end
    if y <= max_scope_y
      y_scope = y + digit - 1
      candidates << number_map[y..y_scope].inject('') { |result, line| result + line[x].to_s }.to_i
    end
  end

  max_num = candidates.max
end

puts max_num


=begin
- パータン1
総当たり
map[i][y..digit - 1]

- パータン2
1. 桁に対応した位置の最大数を探す
2. 最大数の被りを探す
3. そこから作れる数を全て割り出す
4. 比較して最大数を返す
=end
