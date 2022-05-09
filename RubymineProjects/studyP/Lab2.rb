def greeting (age, name, surname)
  if age < 18
    puts "Привет, #{name} #{surname}. Тебе меньше 18 лет,
но начать учиться программировать никогда не рано"
  else
    puts "Привет, #{name} #{surname}. Самое время
заняться делом!"
  end
end

def foobar(first_num, second_num)
  if first_num==20 or second_num==20
    puts second_num
  else
    puts first_num + second_num
  end
end


puts "Введите возраст:"
age = gets.to_i
puts "Введите имя:"
name = gets.chomp
puts "Введите фамилию:"
surname = gets.chomp
puts "Введите первое целое число"
first_num = gets.to_i
puts "Введите второе целое число:"
second_num = gets.to_i
greeting(age, name, surname)
foobar(first_num, second_num)