def compa(name_1, name_2)
  name_numbers = (name_1 + name_2).chars.map{ |char| char.ord - 96 }
  while (name_numbers.size > 1)
    result = []
    (name_numbers.size - 1).times do |index|
      result << name_numbers[index] + name_numbers[index + 1]
      result[index] -= 101 if result[index] > 101
    end
    name_numbers = result
  end
  name_numbers[0]
end


name_1, name_2 = gets.split(' ')
result_1 = compa(name_1, name_2)
result_2 = compa(name_2, name_1)
p result_1 > result_2 ? result_1 : result_2
