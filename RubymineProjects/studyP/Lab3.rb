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
  puts ""
end

def pockemonArray()
  array = []
  puts "Введите количество покемонов:"
  n = gets.to_i
  if n > 0
    for i in 1..n
      puts "Введите имя покемона:"
      name = gets.chomp
      puts "Введите цвет покемона:"
      color = gets.chomp
      array.push({name: name, color: color})
      n -=1
    end
  else
    puts "Число покемонов должно быть больше нуля!"
  end
  array.each { |hash| puts hash}
end

word = gets.chomp
word_processor(word)
pockemonArray()