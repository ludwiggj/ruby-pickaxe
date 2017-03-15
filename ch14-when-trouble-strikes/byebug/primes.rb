#
# Enumerator for primes
#
class SievePrime
  def initialize
    @odd_primes = []
  end

  def next_prime
    candidate = 2
    yield candidate
    not_prime = false
    candidate += 1

    loop do
      @odd_primes.each do |p|
        not_prime = (0 == (candidate % p))
        break if not_prime
      end

      unless not_prime
        @odd_primes << candidate
        yield candidate
      end

      candidate += 2
    end
  end
end

SievePrime.new.next_prime do |prime|
  puts prime
  break if prime > 10
end
