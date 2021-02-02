def pattern(coins, x)
  prices = [500, 100, 50]
  ret = 0
  coins.map!.with_index do |coin, i|
    coin = x / prices[i] if x < coin * prices[i]
    coin
  end

  p coins

  if x >= 500
    while (coins[0] > 0)
      x_2 = x
      x_2 = x_2 - (coins[0] * prices[0])
      if x_2 == 0
        ret += 1
      else
        mod = x_2 / prices[1]
        coin_100 = mod < coins[1] ? mod : coins[1]
        while (coin_100 > 0)
          x_3 = x_2
          x_3 = x_3 - (coin_100 * 100)
          ret += 1 if (x_3 / 50 <= coins[2])
          coin_100 -= 1
        end
      end
      coins[0] -= 1
    end
  end

  if x >= 100
    while (coins[1] > 0)
      x_2 = x
      x_2 = x_2 - (coins[1] * prices[1])
      ret += 1 if x_2 / 50 <= coins[2]
      coins[1] -= 1
    end
  end

  if x >= 50
    ret += 1 if x / 50 <= coins[2]
  end

  ret
end

=begin
a = gets.to_i
b = gets.to_i
c = gets.to_i
x = gets.to_i
p pattern([a, b, c], x)
=end
