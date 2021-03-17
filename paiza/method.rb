def gets_i_array
  gets.split(' ').map(&:to_i)
end

def gets_c_array
  gets.chomp.split(' ')
end

def gets_map_line
  gets.chomp.chars
end
