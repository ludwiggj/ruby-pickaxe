# naive file implementation
class File
  # This is a class method (aka static ?)

  # *args parameter means “collect the actual parameters passed to the method into an array named args.”
  def self.open_and_process(*args)
    # Passing *args to File.open as a parameter expands the array back into individual parameters
    f = File.open(*args)
    yield f
    f.close()
  end

  # naive implementation of File.open
  def self.my_open(*args)
    result = file = File.new(*args)
    # If there's a block, pass in the file and close the file when it returns
    if block_given?
      result = yield file
      file.close
    end
    result
  end

end

File.open_and_process("../misc/testfile", "r") do |file|
  while line = file.gets
    puts line
  end
end

File.my_open("../misc/testfile", "r") do |file|
  while line = file.gets
    puts line
  end
end

f = File.my_open("../misc/testfile", "r")
while line = f.gets
  puts "> " + line
end
f.close

# NOTE: If we wanted to implement these methods properly, we’d need to ensure that we closed a file even
# if the code processing that file somehow aborted. We do this using exception handling.
