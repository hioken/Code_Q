def gets_2_to_i
  gets.split(' ').map(&:to_i)
end

row_num, column_num = gets_2_to_i
first_row = gets_2_to_i
second_row = gets_2_to_i
output = String.new

# 1行目横の差分
first_row_count = first_row[1] - first_row[0]
# 2行目横の差分
second_row_count = second_row[1] - second_row[0]
# row_countの差分
row_count_dif = second_row_count - first_row_count
# 縦の差分
first_cell_count = second_row[0] - first_row[0]

row_num.times do |i|
  # 最初のセルの値
  first_cell = first_row[0] + first_cell_count * i
  # その行でのセルの増減値
  row_count = first_row_count + row_count_dif * i
  # 文字列の作成
  column_num.times do |j|
    output += "#{first_cell + row_count * j} "
  end
  output[-1] = "\n"
end

output.slice(-1)
puts output
