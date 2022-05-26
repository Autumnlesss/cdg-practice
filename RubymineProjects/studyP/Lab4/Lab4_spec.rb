require 'rspec'
require_relative 'Lab4.rb'
require_relative 'Lab4_2.rb'

FILE = "file.txt"
def deposit
  print "Insert deposit value:"
  input = gets
  if float_arg_error?(input)
    puts "Deposit value is incorrect! Try to insert number."
    return 'error'
  end
  dep = input.to_f
  if dep < 0
    puts "Deposit value must be more than 0!"
  else
    @balance += dep
  end
  @balance
end
def withdraw
  print "Insert withdraw value:"
  input = gets
  if float_arg_error?(input)
    puts "Withdraw value is incorrect! Try to insert number."
    return 'error'
  end
  wd = input.to_f
  if wd <0 || wd > @balance
    puts "Withdraw value must be more than 0 and not greater than balance (#{@balance})"
  else
    @balance -= wd
  end
  @balance
end

RSpec.describe "program test" do
  before{
    File.write(FILE,"one\ntwo\nthree")
  @balance = 1000.0
  }

  it "index" do
    expect(index(FILE)).to eq(nil)
  end
  it "find" do
    expect(find(FILE, 1)).to eq("two\n")
  end
  it "where" do
    expect(where(FILE, "two")).to eq([1])
  end
  it "update" do
    expect(update(FILE, 0, "New")).to eq(1)
  end
  it "delete" do
    expect(delete(FILE, 1)).to eq(1)
  end

  it "find_std_by_age" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('20','-1')
    expect(find_std_by_age).to eq(nil)
  end
  it "find_std_by_age" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(
      '20','18','19','21','22','25','-1')
    expect(find_std_by_age).to eq(nil)
  end

  it "deposit" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('1000.0')
    expect(deposit).to eq(2000)
  end
  it "deposit_wrong" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Hello')
    expect(deposit).to eq('error')
  end
  it "deposit_wrong" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('-100')
    expect(deposit).to eq(1000)
  end

  it "withdraw" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('100.0')
    expect(withdraw).to eq(900)
  end
  it "withdraw_incorrect" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Hello')
    expect(withdraw).to eq('error')
  end
  it "withdraw_incorrect" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('-100')
    expect(withdraw).to eq(1000)
  end
  it "withdraw_incorrect" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('1100')
    expect(withdraw).to eq(1000)
  end
end