def gets_i_array
  gets.split(' ').map(&:to_i)
end

taxi_num, distance = gets_i_array
taxis_fare = []

taxi_num.times do
  fare = gets_i_array
  if distance < fare[0]
    taxis_fare << fare[1]
  else
    left = distance - fare[0]
    taxis_fare << fare[1] + ((left / fare[2] + 1) * fare[3])
  end
end

puts "#{taxis_fare.min} #{taxis_fare.max}"
