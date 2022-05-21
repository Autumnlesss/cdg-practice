
class CashMachine
  BALANCE = 'balance.txt'

  def init
    if !File.exist?(BALANCE)
      @balance = 100.0
    else
      @balance = File.open(BALANCE, &:gets).to_f
    end

    loop do
      puts "Choose required action:"
      puts "D - Deposit"
      puts "W - Withdraw"
      puts "B - Balance"
      puts "Q - Quit"
      command = gets.chomp
      case command
      when "D","d"
        deposit
      when "W","w"
        withdraw
      when "B","b"
        get_balance
      when "Q","q"
        break
      else
        puts "Input is incorrect! Please choose existing command."
      end
    end
    File.write(BALANCE, @balance)
  end

  def get_balance
    puts "Balance: #{@balance}"
  end

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

  def int_argument_error?(*args)
    begin
      args.each do |arg|
        arg = Integer (arg)
      end
    rescue  ArgumentError
      true
    else
      false
    end
  end

  def float_arg_error?(*args)
    begin
      args.each do |arg|
        arg = Float(arg)
      end
    rescue ArgumentError
      true
    else
      false
    end
  end

end

