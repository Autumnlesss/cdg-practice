require 'rspec'
require_relative 'CashMachine'
load 'CashMachine.rb'

BALANCE = 'balance.txt'
subject = CashMachine.new

RSpec.describe "CashMachine" do
  before{
    File.write(BALANCE, 1000.0)
  }

  it "get_balance" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('b','q')
    expect(subject)
    expect(subject.get_balance).to eq(nil)
  end

  it "deposit" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('d','100','q')
    expect(subject.deposit)
    expect(File.read(BALANCE)).to eq('1000.0')
  end

  it "deposit_incorrect" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('d','Hello','q')
    expect(subject)
    expect(File.read(BALANCE)).to eq('1000.0')
  end

  it "deposit_incorrect" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('d','-100','q')
    expect(subject)
    expect(File.read(BALANCE)).to eq('1000.0')
  end

  it "withdraw" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('w','100','q')
    expect(subject.withdraw)
    expect(File.read(BALANCE)).to eq('1000.0')
  end

    it "withdraw_incorrect" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('w','Hello','q')
      expect(subject)
      expect(File.read(BALANCE)).to eq('1000.0')
    end

    it "withdraw_incorrect" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('w','-100','q')
      expect(subject)
      expect(File.read(BALANCE)).to eq('1000.0')
    end

    it "withdraw_incorrect" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('w','1100','q')
      expect(subject)
      expect(File.read(BALANCE)).to eq('1000.0')
    end
end
