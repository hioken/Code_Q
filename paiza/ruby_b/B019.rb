def gets_i_array
  gets.split(' ').map(&:to_i)
end

size, rate = gets_i_array
image = []; size.times { image << gets_i_array }
reduced = []
cell = size / rate

cell.times do |i|
  scope_y = (i * rate)..(i * rate + rate - 1)
  tmp = []

  cell.times do |j|
    ave = 0
    scope_x = (j * rate)..(j * rate + rate - 1)
    image[scope_y].each do |line|
      ave += line[scope_x].inject { |total, i| total + i }
    end
    ave /= rate ** 2
    tmp << ave
  end

  reduced << tmp
end

reduced.each do |line|
  puts line.join(' ')
end
