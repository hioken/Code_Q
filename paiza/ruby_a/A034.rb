=begin
  同じ種類は複数買わない
  種類の数 > お釣り最小
=end

def cut_confe(confectionaries, cart_last, cart_size, money, total)
  if cart_size < confectionaries.size && cart_size > 0
    idx = 0
    confectionaries.slice!(0..(cart_size - 1))

    confectionaries.each do |confe|
      if money > total - cart_last + confe
        idx += 1
      else
        break
      end
    end
    confectionaries.slice!(idx..-1)
    if confectionaries.size > 0
      return confectionaries.size
    else
      return false
    end
  else
    return false
  end
end

def min_change(confectionaries, cart_o, money, change)
  cart_size = cart_o.size
  confe_size = confectionaries.size

  cart = cart_o.map{ |d| d }
  min_scope = cart.size
  cart_size.times do |i|
    cart[(0 + i)..-1] = confectionaries[0..i].to_a
    if cart.sum > money
      min_scope = i
      (i > 0 ? (break) : (return change))
    end
  end

  confe_size.times do |scope|
    scope = min_scope + scope
    (confe_size - scope + 1).times do |i|
      cart = cart_o.map.concat(confectionaries[(0 + i)..(scope + i)])
      flg = false
      cart.combination(cart_size).each do |pair|
        if money - pair.sum < change
          change = money - pair.sum
          flg = true
        end
      end

      if !(flg)
        return change
      end
    end
  end
end


confe_num, money = gets.split(' ').map(&:to_i)
confectionaries = []
confe_num.times do |i|
  input = gets.to_i
  idx = 0
  confectionaries.each do |y|
    if y < input
      idx += 1
    else
      break
    end
  end
  confectionaries.insert(idx, input)
end

cart = []
total = 0

confectionaries.each do |confe|
  if total + confe <= money
    cart << confe
    total += confe
  else
    break
  end
end

result = cut_confe(confectionaries, cart.last, cart.size, money, total)

if result
  change = min_change(confectionaries, cart, money, money - total)
else
  change = money - total
end

puts change
