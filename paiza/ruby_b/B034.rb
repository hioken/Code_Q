class Robot
  DIRECTIONS = {'F' => 0, 'R' => 1, 'B' => 2, 'L' => 3}
  attr_reader :point

  def initialize(point, strides, direction = 0)
    # [x, y]
    @point = point
    # [前, 右, 後, 左]
    @strides = strides
    @direction = direction
  end

  def move(move_d)
    stride = @strides[(DIRECTIONS[move_d])]
    case derive(move_d)
    when 0
      @point[1] += stride
    when 1
      @point[0] += stride
    when 2
      @point[1] -= stride
    when 3
      @point[0] -= stride
    end
  end

  def turn(turn_d)
    @direction = derive(turn_d)
  end

  def derive(order_d)
    (@direction + DIRECTIONS[order_d]) % 4
  end
end


def gets_i_array
  gets.split(' ').map(&:to_i)
end


start_p = gets_i_array
strides = gets_i_array
robot = Robot.new(start_p, strides)
order_c = gets.to_i

order_c.times do
  order = gets.chomp.split(' ')
  if order[0] == 'm'
    robot.move(order[1])
  else
    robot.turn(order[1])
  end
end

puts robot.point.join(' ')
