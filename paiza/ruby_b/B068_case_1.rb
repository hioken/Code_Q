def choco_1(chocolate_map)
result_map = []
y_n =
  chocolate_map.each do |choco_row|
    flag = false
    (choco_row.size - 1).times do |i|
      alice = choco_row[0..i]
      bob = choco_row[(i+1)..-1]
      if alice.inject(:+) == bob.inject(:+)
        alice.map! { 'A' }
        bob.map! { 'B' }
        result_map << (alice + bob)
        flag = true
      end
    end
    break false unless flag
  end

puts (y_n ? 'Yes' : 'No')
result_map.each do |row|
  puts row.join
end

end
# 実行時間検証
# 13辺り、timeで代入するのと、aliceごと書き換えるの
# テストで10000回繰り返す
