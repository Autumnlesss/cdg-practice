require 'rspec'

def word_processor (word)
  if word[word.length-1] == "s" and word[word.length-2] == "c"
    return 2**word.length
  else
    i = word.length
    arr = [word.length]
    j = 0
    while i > 0
      i -=1
      arr[j] = word[i]
      j +=1
    end
    return arr.join()
  end
end

def pockemon_array()
  array = []
  puts ""
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

RSpec.describe "word_processor" do
  it 'wp_correct_1st_way' do
    expect(word_processor("Critics")).to eq(128)
  end
  it 'wp_correct_2nd_way' do
    expect(word_processor("hello")).to eq("olleh")
  end
end
