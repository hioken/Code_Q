def gets_c_array
  gets.chomp.split(' ')
end

def search_isle(fixed, sy, sx)
  sy.times do |y|
    sx.times do |x|
      return [y, x] if !(fixed[y][x])
    end
  end
  return false
end

def relate(y, x, sy, sx, tmp, map, fixed)
  ret = 0
  if y > 0 && map[y - 1][x] == '#'
    ret += 1
    if !(fixed[y - 1][x])
      tmp << [y - 1, x]
      fixed[y - 1][x] = true
    end
  end
  if y < sy - 1 && map[y + 1][x] == '#'
    ret += 1
    if !(fixed[y + 1][x])
      tmp << [y + 1, x]
      fixed[y + 1][x] = true
    end
  end
  if x > 0 && map[y][x - 1] == '#'
    ret += 1
    if !(fixed[y][x - 1])
      tmp << [y, x - 1]
      fixed[y][x - 1] = true
    end
  end
  if x < sx - 1 && map[y][x + 1] == '#'
    ret += 1
    if !(fixed[y][x + 1])
      tmp << [y, x + 1]
      fixed[y][x + 1] = true
    end
  end
  ret
end


sy, sx = gets.split(' ').map(&:to_i)
map = []    ;sy.times { |i| map << gets.chomp.chars }
fixed = []  ;map.each { |line| fixed << line.map { |sq| sq == '.' ? true : false } }
isles = []
tmp = []

loop do
  sq = search_isle(fixed, sy, sx)
  if sq
    cnt = 0
    tmp << sq
    isles << [0, 0]
    while tmp.size > 0
      y, x = tmp.last
      tmp.delete_at(-1)
      fixed[y][x] = true
      isles.last[1] += 1
      isles.last[0] += 4
      cnt += relate(y, x, sy, sx, tmp, map, fixed)
    end
    isles.last[0] -= cnt
  else
    break
  end
end

ret = isles.sort_by{ |len, ar| len * 100 + ar }.reverse

ret.each do |isle|
  puts isle.reverse.join(' ')
end
