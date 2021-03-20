input_line, average = gets.split(' ').map(&:to_i)
tree_lights = []
input_line.times { tree_lights << gets.to_i }
input_query = gets.to_i
queries = []
input_query.times do
  q_start, q_end = gets.split(' ').map { |i| i.to_i - 1 }
  q_scope = q_end - q_start
  add = average - (tree_lights[q_start..q_end].inject { |total, light| total + light } / q_scope)
  if add > 0
    tree_lights[q_start..q_end] = tree_lights[q_start..q_end].map{ |i| i += add }
  end
end

puts tree_lights.join(' ')
