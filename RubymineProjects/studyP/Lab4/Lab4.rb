STD_PATH = 'students.txt'
BUFFER = 'buffer.txt'

def index(file)
  File.foreach(file){|student| puts student}
end

def find(name, id)
  File.foreach(name).with_index do |line, index|
    @f_line = line if index.equal?(id)
  end
  @f_line
end

def where(name, pattern)
  @line_id = []
  File.foreach(name).with_index do |line, index|
    @line_id.push(index) if line.include? (pattern)
  end
  @line_id
end

def update(name, id, text)
  file = File.open(BUFFER, 'w')
  File.foreach(name).with_index do |line, index|
    file.puts (id.equal?(index) ? text : line)
  end
  file.close
  File.write(name,File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(name, id)
  file = File.open(BUFFER, 'w')
  File.foreach(name).with_index do |line, index|
    if id != index
      file.puts(line)
    end
  end
  file.close
  File.write(name, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
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
