def gets_i_array
  gets.split(' ').map(&:to_i)
end

def gets_map_line
  gets.chomp.chars
end

class Bed
  attr_reader :rope

  def initialize(map, map_y, map_x)
    @map = map
    @map_y = map_y
    @map_x = map_x
    @rope = 0
    rope_count
  end

  def search_flower(x, y)
    @rope += 1 if y - 1 < 0 or @map[y-1][x] == '.'
    @rope += 1 if y + 1 >= @map_y or @map[y+1][x] == '.'
    @rope += 1 if x - 1 < 0 or @map[y][x-1] == '.'
    @rope += 1 if x + 1 >= @map_x or @map[y][x+1] == '.'
  end

  def search_flower_line(x)
    @rope += 2
    @rope += 1 if @map[x-1] == '.' or x - 1 < 0
    @rope += 1 if @map[x+1] == '.' or x + 1 >= @map_x
  end

  def rope_count
    @map_y.times do |y|
      @map_x.times do |x|
        search_flower(x, y) if @map[y][x] == '#'
      end
    end
  end
end

map_y, map_x = gets_i_array
map = []; map_y.times { map << gets_map_line }
bed = Bed.new(map, map_y, map_x)
p bed.rope
