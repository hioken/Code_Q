q_num = gets.to_i
points = []; q_num.times { points << gets.to_i }
selection = [0]

1.upto(q_num) do |scope|
  points.combination(scope).each { |combi| selection << combi.sum }
end

result = selection.uniq.sort
puts result.size
result.each { |i| puts i }
