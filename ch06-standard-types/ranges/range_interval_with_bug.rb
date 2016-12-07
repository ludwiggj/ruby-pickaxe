# This case statement has a bug as it uses inclusive ranges but incorrectly

def age(car_age)
  case car_age
  when 0..0
    puts "Mmm.. new car smell"
  when 1..2
    puts "Nice and new"
  when 3..9
    puts "Reliable but slightly dinged"
  when 10..29
    puts "Clunker"
  else
    puts "Vintage gem"
  end
end

age(9)
age(9.5)
age(10)
