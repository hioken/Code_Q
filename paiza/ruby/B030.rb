class Dungeon
  attr_reader :p_now

  def initialize(d_map, p_now, line_y, line_x)
    @d_map = d_map
    @p_now = p_now
    @line_y = line_y
    @line_x = line_x
  end

  def move(direction)
    case direction
      when 'U'
        line = []
        x = p_now[1]
        (@p_now[0] - 1).times do |i|
          line << @d_map[i][x]
        end
        move = search_stop(line.reverse)
        @p_now[0] -= move
      when 'D'
        line = []
        x = p_now[1]
        (@line_y - @p_now[0] - 1).times do |i|
          line << @d_map[@p_now[0] + 1 + i][x]
        end
        move = search_stop(line)
        @p_now[0] += move
      when 'R'
        line = @d_map[(@p_now[1] + 1)..-1]
        move = search_stop(line)
        @p_now[1] += move
      when 'L'
        line = @d_map[0..(@p_now[1] - 1)]
        move = search_stop(line.reverse)
        @p_now[1] += move
      end
  end

  def search_stop(line)
    count = 0
    line.each do |point|
      count += 1
      break count if point != '#'
    end
    count
  end
end

def gets_i_array
  gets.split(' ').map(&:to_i)
end

line_x, line_y = gets_i_array
map = []
line_y.times { map << gets.chomp.chars }
p_now = gets_i_array
dungeon = Dungeon.new(map, p_now, line_y, line_x)

num_moves = gets.to_i
num_moves.times do
  dungeon.move(gets.chomp)
end

puts dungeon.p_now.join(' ')

=begin
1.進行方向をループでチェック、氷の度+1, 土ならbreak count
2.進行方向に

memo
壁に進む事が想定できていない
=end
