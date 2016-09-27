class Octal
  attr_accessor :octal_number, :digits

  private :digits

  def initialize(number, multiplyer=8)
    @octal_number = number.reverse.chars
    @base_number = multiplyer
  end

  def valid_numbers?
    @octal_number.each{ |n| return false if n =~ /\D/ || n.to_i >= @base_number }
  end

  public

  def to_decimal
    return 0 unless valid_numbers?
    digits = @octal_number.map(&:to_i)
    result =
      digits.collect.with_index do |n,i|
        n * OCTAL_MULTIPLIER ** i
      end.inject(:+)
  end

end
