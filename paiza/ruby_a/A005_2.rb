class Frame
  attr_accessor :first, :second, :third, :state
  def initialize (first, second = nil, third = 0)
    @first = first
    @second = second
    @third = third
    @state = 0
  end

  def state_initialize(pin)
    if @first == pin && @second == pin
      @state = 3
    elsif @first == pin
      @state = 2
    elsif (@first + @second == pin)
      @state = 1
    end
  end

  def score
    @first + @second.to_i
  end
end

def gets_i_array
  gets.split(' ').map(&:to_i)
end

def set_frame(pin, frame_num, frame_a, throw_a)
  frame_cnt = 0
  pt = -1
  frame_num.times do |f|
    first = throw_a[pt += 1]
    second = (first < pin ? throw_a[pt += 1] : nil)
    frame_a << Frame.new(first, second)
    frame_a.last.state_initialize(pin)
    if f == frame_num - 1 && frame_a.last.state > 0
      frame_a.last.second = throw_a[-2]
      frame_a.last.third = throw_a[-1]
      frame_a.last.state_initialize(pin)
    end
  end
end

def score_sum(pin, frame_num, frame_a)
  before = 0
  total = 0

  (frame_num - 1).times do |idx|
    frame = frame_a[idx]
    score = frame.score
    if frame.state == 2
      next_f = frame_a[idx + 1]
      next_1 = next_f.first
      next_2 = ( (next_f.state == 2 && !(next_f.second)) ? frame_a[idx + 2].first : next_f.second )
      score += next_1 + next_2
    elsif frame.state == 1
      score += frame_a[idx + 1].first
    end
    total += score
  end

  last_f = frame_a.last

  case last_f.state
  when 3
    total += last_f.first + last_f.second * 2 + last_f.third * 3
  when 2
    total += last_f.first + last_f.second * 2 + last_f.third * 2
  when 1
    total += last_f.score + last_f.third * 2
  else
    total += last_f.score
  end

  total
end


frame_num, pin, throw_num = gets_i_array
throw_a = gets_i_array

frame_a = []
set_frame(pin, frame_num, frame_a, throw_a)
score = score_sum(pin, frame_num, frame_a)

puts score
