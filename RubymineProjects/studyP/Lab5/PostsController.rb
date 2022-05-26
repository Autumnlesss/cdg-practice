require_relative 'Lab4.rb'
load 'Resource.rb'

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    @posts.each.with_index do |post, index|
      puts "[#{index}] #{post}"
    end
  end

  def show
    print "Enter index of post to show:"
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

    puts "[#{index}] #{@posts[index]}"
  end

  def create
    print "Write a post:"
    post = gets.chomp
    @posts << post

    puts "Index of your post: #{@posts.find_index(post)}"
    puts "Text of your post: #{post}"
  end

  def update
    print "Enter index of post to update: "
    input = gets

    if int_argument_error?(input)
      pust "Index is incorrect. Please, write a number."
      return 'error'
    end

    index = input.to_i

    if index < 0
      puts "Index is incorrect. Please, write a number."
      return 'error'
    end

    puts "Text of post with index #{index}:"
    puts "#{@posts[index]}"

    puts "Write a new post:"
    @posts[index] = gets.chomp
  end

  def destroy
    print "Enter index of post to delete"
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

    @posts.delete_at(index)
  end
end
