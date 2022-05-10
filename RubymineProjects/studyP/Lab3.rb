def word_processor (word)
  if word[word.length-1] == "s" and word[word.length-2] == "c"
    puts 2**word.length
  else
    i = word.length
    while i > 0
      i -=1
      print word[i]
    end
  end
end

def pockemonArray()
  array = []
  puts "Введите количество покемонов:"
  n = gets.to_i
  if n > 0
    
  else
    puts "Число покемонов должно быть больше нуля"
  end
end

word = gets.chomp
word_processor(word)