class File
  def self.new(file, *args)
    if file.respond_to?(:to_int)
      IO.new(file.to_int, *args)
    else
      name = file.to_str
      # call operating system to open file 'name'
      puts "call operating system to open file #{name}"
    end
  end
end

a_file = File.new(1, 'w')

a_file.puts "This is a test"

b_file = File.new('hello.txt')
