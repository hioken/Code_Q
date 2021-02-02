
def judge(s)
  while (s.size != 0)
    word = s.size > 6 ? s[-7..-1] : s
    return "NO" unless checking(s, word)
  end
  "YES"
end

def checking(s, word)
  check_words = "dreamer eraser dream erase".split(" ")
  check_words.each do |check_word|
    if word.include?(check_word)
      s.delete_suffix!(check_word)
      return true
    end
  end
  false
end

s = gets.chomp
print judge(s)
