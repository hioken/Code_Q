

def gets_i_array
  gets.split(' ').map(&:to_i)


items = gets_i_array
gold, order_c = gets_i_array
order_c.time do
  i, count = gets_i_array
  amount = items[i - 1] * count
  gold - amount if gold > amount
end
puts gold
