#
# Solves the classic Towers of Hanoi puzzle.
#
def hanoi(n, a, b, c)
  hanoi(n - 1, a, c, b) if n - 1 > 0

  puts "Move disk #{a} to #{b}"

  hanoi(n - 1, c, b, a) if n - 1 > 0
end

n_args = $ARGV.length

raise('*** Need number of disks or no parameter') if n_args > 1

n = 3

if n_args > 0
  begin
    n = $ARGV[0].to_i
  rescue ValueError
    raise("*** Expecting an integer, got: #{$ARGV[0]}")
  end
end

raise('*** Number of disks should be between 1 and 100') if n < 1 || n > 100

hanoi(n, :a, :b, :c)
