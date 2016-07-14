p [1, 3, 5, 7, 9].find {|v| v*v > 30 }

def find(arr)
  arr.each do |value|
    return value if yield(value)
  end
  nil
end

p find([1, 3, 5, 7, 9]) {|v| v*v > 13 }
p find([1, 3, 5, 7, 9]) {|v| v*v > 100 }
