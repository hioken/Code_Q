class Isle
  attr_accessor :id
  attr_reader :area, :len
  def initialize(id)
    @id = id
    @area = 0
    @len = 0
  end

  def set_area_len
    $squares.delete_if do |square|
      if square.isle_id == @id
        @area += 1
        @len += (4 - square.relation)
        true
      else
        false
      end
    end
  end

  def sort_num
    @area * 100 + @len
  end

  def result
    "#{@area} #{@len}"
  end
end

class Square
  attr_reader :isle_id, :relation
  def initialize (isle_id, y, x)
    @isle_id = isle_id
    @y = y
    @x = x
    @relation = 0
  end

  def search_relation
    @relation += 1 if @y > 0 && $map[@y - 1][@x] == '#'
    @relation += 1 if @x > 0 && $map[@y][@x - 1] == '#'
    @relation += 1 if @y < $sy - 1 && $map[@y + 1][@x] == '#'
    @relation += 1 if @x < $sx - 1 && $map[@y][@x + 1] == '#'
  end
end


def search_isle
  $sy.times do |y|
    $sx.times do |x|
      return [y, x] if !($fixed[y][x])
    end
  end
  return false
end

def relate(id, y, x)
  t_x = x
  t_y = y - 1
  sq_checked(id, t_y, t_x) if y > 0 && !($fixed[t_y][t_x])
  t_y = y + 1
  sq_checked(id, t_y, t_x) if y < $sy - 1 && !($fixed[t_y][t_x])

  t_y = y
  t_x = x - 1
  sq_checked(id, t_y, t_x) if x > 0 && !($fixed[t_y][t_x])
  t_x = x + 1
  sq_checked(id, t_y, t_x) if x < $sx - 1 && !($fixed[t_y][t_x])
end

def sq_checked(id, y, x)
  $fixed[y][x] = true
  $squares << Square.new(id, y, x)
  relate(id, y, x)
end


$sy, $sx = gets.split(' ').map(&:to_i)
$map = []    ; $sy.times { |i| $map << gets.chomp.chars }
$fixed = []  ; $map.each { |line| $fixed << line.map { |sq| sq == '.' ? true : false } }
isles = []
$squares = []

loop do
  sq = search_isle
  if sq
    id = isles.size
    isles << Isle.new(id)
    y, x = sq
    sq_checked(id, y, x)
  else
    break
  end
end

$squares.each { |sq| sq.search_relation }
isles.each { |isle| isle.set_area_len }

results = isles.sort_by{ |isle| isle.sort_num }.reverse
results.each { |isle| puts isle.result }
