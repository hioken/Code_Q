n = gets.to_i
cards = gets.split(" ").map(&:to_i).sort { |num_a, num_b| num_b <=> num_a }

alice, bob = 0, 0

cards.each_with_index do |card, index|
  if index.even?
    alice += card
  else
    bob += card
  end
end

p alice - bob
