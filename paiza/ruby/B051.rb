=begin
- 0は二つ
	- 1列は0が含まれない事が保障されている
1. 横→縦の順で、0が含まれない列を1つ、0が1つになる列を2つ探す
	 - [0がない列の和, [0位置1の和, 0位置i1, 0位置y1], [0位置2の和, 0位置i2, 0位置y2]]を返す
2. 1の、0が含まれない列の和を出す
3. 2から、1の0が1つになる列の総和を引いた数を出す
4. 3を、3で使った列の0の位置に代入
5. 3 ~ 4を、もう一つの0の列で行う
=end

def gets_i_array
  gets.split(' ').map(&:to_i)
end

def search_column(square_size, square)
	ret = [[0, 0, 0], [0, 0, 0], 0]
	work_square = square.map { |x| x}
	square.transpose.each {|a| work_square << a}
	t_flg = false
	z_flg = 0

	(square_size * 2).times do |i|
		z_cnt = 0
		square_size.times do |y|
			z_cnt += 1 if work_square[i][y] == 0
		end

		if !t_flg && z_cnt == 0
			ret[2] = work_square[i].sum
			t_flg = true
		elsif z_cnt == 1
			ret[z_flg][0] = work_square[i].sum
			if i < square_size
				ret[z_flg][1] = i
				ret[z_flg][2] = work_square[i].index(0)
			else
				ret[z_flg][2] = i % square_size
				ret[z_flg][1] = work_square[i].index(0)
			end
			z_flg += 1
		end
		break if z_flg >= 2 && t_flg
	end

	ret
end

square_size = gets.to_i
square = []; square_size.times { square << gets_i_array }

point = search_column(square_size, square)
total = point.delete_at(2)

point.each do |sum, i, y|
	square[i][y] = total - sum
end

square.each do |row|
	puts row.join(' ')
end
