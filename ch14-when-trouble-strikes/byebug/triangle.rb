#
# The n'th triangle number: triangle(n) = n*(n+1)/2 = 1 + 2 + ... + n
#
def triangle(n)
  tri = 0

  0.upto(n) { |i| tri += i }

  tri
end

if __FILE__ == $PROGRAM_NAME
  t = triangle(3)
  puts t
end
