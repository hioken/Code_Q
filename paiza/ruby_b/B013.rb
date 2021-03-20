=begin
1.電車降りる時刻 + c が < 9:00の物を探す
2.その電車の到着 - a
=end

def gets_i_array
  gets.split(' ').map(&:to_i)
end

def time_to_m(time)
  time[0] * 60 + time[1]
end

def minutes_to_t(minutes)
  "#{(minutes / 60).to_s.rjust(2, '0')}:#{(minutes % 60).to_s}"
end

time_abc = gets_i_array
route = gets.to_i
trains = []
route.times { trains << gets_i_array }
trains.map! { |a| time_to_m(a) }
trains.reverse!

safe =
  trains.each do |depart|
    break depart if depart + time_abc[1] + time_abc[2] < 540
  end

depart_time = (safe - time_abc[0])
puts minutes_to_t(depart_time)
