class Trinary
  attr_accessor :tri_numbers

  def initialize(number, base=3)
    @tri_numbers = number.reverse.chars
    @multiplier  = base
  end

  def valid_numbers?
    @tri_numbers.each{ |n| return false if n =~ /\D/ || n.to_i >= @multiplier }
  end

  def to_decimal
    return 0 unless valid_numbers?
    digits = tri_numbers.map(&:to_i)
    result =
      digits.collect.with_index do | n, i |
        n * @multiplier ** i
      end.inject(:+)
  end
end
