replace_num, replacement_chars = gets.split(' ')
replace_num = replace_num.to_i
replacement_chars = replacement_chars.chars
a_to_z = ('a'..'z').to_a
sentence = gets.chomp.chars

replace_num.times do
  sentence.map! do |c|
    if c.match?(/[a-z]/)
      i = replacement_chars.index(c)
      a_to_z[i]
    else
      c
    end
  end
end

puts sentence.join
