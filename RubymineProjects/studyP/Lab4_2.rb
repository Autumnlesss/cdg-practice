require_relative 'Lab4.rb'
gem 'fileutils'
require 'fileutils'


RESULTS = 'result.txt'
STUDENTS = 'students.txt'

def index(file)
  File.foreach(file){|student| puts student}
end

def find_std_by_age
  File.truncate(RESULTS, 0)
  index(STUDENTS)
  print "Insert student age:"
  age = gets.chomp
  while (age.to_i > -1)
    exp_to_file(where(STUDENTS, age))
    break if FileUtils.identical?(STUDENTS, RESULTS)
    print "Insert student age:"
    age = gets.chomp
  end
  index(RESULTS)
end

def exp_to_file(new_line_ids)
  new_line_ids.each do |new_line_id|
    new_line = find(STUDENTS, new_line_id)
    if where(RESULTS, new_line) == []
      results = File.open(RESULTS, "a")
      results.puts(new_line)
      results.close
    end
  end
end

find_std_by_age
