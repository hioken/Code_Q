def happy_count(cake, p_y, p_x)
  sc = [[0, p_y - 1, 0, p_x - 1], [0, p_y - 1, p_x, -1], [p_y, -1, p_x, -1], [p_y, -1, 0, p_x - 1]]
  happies = []

  4.times do |i|
    surface = [0, 0]

    cake[(sc[i][0])..(sc[i][1])].each do |x_line|
      x_line[(sc[i][2])..(sc[i][3])].each do |block|
        if block == '@'
          surface[0] += 1
        else
          surface[1] += 1
        end
      end
    end

    happies << (surface[0] ** 2) + surface[0] + surface[1]
  end
  happies
end

def point_shift(happies, p_y, p_x)
  comparison = []
  4.times do |i|
    comparison << happies[i] + happies[(i + 1) % 4]
  end

  case comparison.index(comparison.max)
  when 0
    [p_y - 1, p_x]
  when 1
    [p_y, p_x + 1]
  when 2
    [p_y + 1, p_x]
  when 3
    [p_y, p_x - 1]
  end
end

# ここから始動
input = gets.split(' ').map(&:to_i)
cake = []
input[0].times { cake << gets.chomp.chars }
p_y, p_x = input.map { |len| len / 2 }
flag = true

happies = happy_count(cake, p_y, p_x)
gap = happies.max - happies.min
y_tmp, x_tmp = p_y, p_x
gap_tmp = gap

while (flag)
  p_y, p_x = point_shift(happies, p_y, p_x)
  happies = happy_count(cake, p_y, p_x)
  gap = happies.max - happies.min
  if gap_tmp < gap
    flag = false
  else
    gap_tmp = gap
    y_tmp, x_tmp = p_y, p_x
  end
end

puts "#{y_tmp} #{x_tmp}"
# ↑が結果
# ↑が結果


=begin
1.最初真ん中で区切って、満足度を出す
2.周りの上下左右の2つずつの満足度合計の内、一番大きな方向へ動かし、また満足度を出す
3.1と2を比較して、2の方が大きければ、2を1にしてもう一度やり直す

区切りの配列を用意するパターンと用意しないパターンで実行時間調べる
=end
