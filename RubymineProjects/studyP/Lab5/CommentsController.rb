require_relative 'Lab4.rb'
load 'Resource.rb'

class CommentsController
  extend Resource

  def intialize
    @comments = []
  end

  def index
    @comments.each.with_index do |comment, index|
      puts "[#{index} #{comment}]"
    end
  end

  def show
    print "Enter index of comment to show: "
    input = gets

    if int_argument_error?(input)
      puts "Index is incorrect. :lease, write a number."
      return 'error'
    end

    index = input.to_i

    if index < 0
      puts "Index must be 0 or higher."
      return 'error'
    end

    puts "[#{index}] #{@comments[index]}"
  end

  def create
    print "Write a comment:"
    comment = gets.chomp

    @comments << comment

    puts "Index of your comment: #{@comments.find_index(comment)}"
    puts "Text of your comment: #{comment}"
  end

  def update
    print "Enter index of comment to update: "
    input = gets

    if int_argument_error?(input)
      puts "Index is correct. Please, write a number."
      return 'error'
    end

    index = input.to_i

    if index < 0
      puts "Index must be 0 or higher."
      return 'error'
    end

    puts "Text of comment with index #{index}:"
    puts "#{@commetns[index]}"

    puts "Write a new comment:"
    @comments[index] = gets.chomp
  end

  def destroy
    print "Enter index of comment to delete: "
    input = gets

    if int_argument_error?(input)
      puts "Index is incorrect. Please, write a number."
      return 'error'
    end

    index = input.to_i

    if index < 0
      puts "Index must be 0 or higher."
      return 'error'
    end

    @comments.delete_at(index)
  end
end
