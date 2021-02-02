n, a, b = gets.split(" ").map(&:to_i)
total = 0

for num in 1..n
  target_result = 0
  check_number = num.to_s.chars
  check_number.each do |i|
    target_result += i.to_i
  end
  if target_result.between?(a, b)
    total += num
  end
end

print total
