
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
  cart_o.concat(confectionaries).combination(cart_o.size).each do |pair|
    if money - pair.sum > change
      change = pair.sum
    end
  end

  change
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
