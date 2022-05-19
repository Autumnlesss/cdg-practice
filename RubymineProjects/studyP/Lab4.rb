STD_PATH = 'stud.txt'
BUFFER = 'buffer.txt'

def index
  File.foreach(STD_PATH){|student| puts student}
end

def find(id)
  File.foreach(STD_PATH).with_index do |line, index|
    @line = line if index == id
  end
  @line
end

def where(name)
  File.foreach(STD_PATH).with_index do |line, index|
    @line_id = index if line.include? (name)
  end
  @line_id
end

def update(id, name)
  file = File.open(BUFFER, 'w')
  File.foreach(STD_PATH).with_index do |line, index|
    file.puts (id == index ? name : line)
  end
  file.close
  File.write(STD_PATH,File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  file = File.open(BUFFER, 'w')
  File.foreach(STD_PATH).with_index do |line, index|
    file.puts(line) if id != index
  end
  file.close
  File.write(STD_PATH, File.read(BUFFER))
  File.delete(BUFFER) if    File.exist?(BUFFER)
end