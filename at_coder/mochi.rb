mochies = []
n = gets.to_i

n.times { mochies << gets.to_i }
print mochies.uniq.size
