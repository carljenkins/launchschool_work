class Sieve
  attr_accessor :max_n, :sieve
  REMOVED = 'X'
  NOT_SELECTED = ''

  def initialize(n)
    @max_n = n
    @sieve = {}
    2.upto(max_n){|n| @sieve[n] = NOT_SELECTED }
  end

  def primes
    start = 2
    numbers_not_marked = []
    loop do
      sieve.keys.each do |n|
        next if n == start
        if n % start == 0 && sieve[n] == NOT_SELECTED
          sieve[n] = REMOVED
        end
      end
      start = start.succ
      break if (start * start) > max_n
    end
    numbers_not_marked = sieve.select{|_k, v| v == NOT_SELECTED }.keys
  end
end
