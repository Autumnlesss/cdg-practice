require 'rspec'

def greeting (age, name, surname)
  if age < 18
    return "Привет, #{name} #{surname}. Тебе меньше 18 лет,
но начать учиться программировать никогда не рано"
  else
    return "Привет, #{name} #{surname}. Самое время
заняться делом!"
  end
end

def foobar(first_num, second_num)
  if first_num==20 or second_num==20
    return second_num
  else
    return first_num + second_num
  end
end

RSpec.describe "greeting" do
  it 'greeting_correct' do
    expect(greeting(18, "Илья", "Гагарин")).to eq("Привет, Илья Гагарин. Самое время
заняться делом!")
    end
    it 'greeting_corect_2' do
      expect(greeting(17, "Илья", "Гагарин")).to eq("Привет, Илья Гагарин. Тебе меньше 18 лет,
но начать учиться программировать никогда не рано")
    end
  end

RSpec.describe "foobar" do
  it 'foobar_correct' do
    expect(foobar(20,10)).to eq(10)
  end
  it 'foobar_correct_2' do
    expect(foobar(10,10)).to eq(20)
  end
end