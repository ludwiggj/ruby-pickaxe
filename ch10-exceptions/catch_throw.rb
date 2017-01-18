def prompt_and_get(prompt)
  print prompt
  res = readline.chomp
  throw :quit_requested if res == "!"
  res
end

catch :quit_requested do
  name = prompt_and_get("Name: ")
  age = prompt_and_get("Age: ")
  sex = prompt_and_get("Sex: ")

  puts "You entered 'Name: #{name}',  'Age: #{age}',  'Sex: #{sex}'"
  # process information
end
