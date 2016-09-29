
# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
# 10000 = Reverse the order of the operations in the secret handshake.
# 128 - 64 - 32 - 16 - 8 - 4 - 2 - 1
class SecretHandshake
    COMMANDS = { '1' => 'wink', '10' => 'double blink', '100' => 'close your eyes', '1000' => 'jump'}

  def initialize(handshake_code)
    @decimal = handshake_code
  end

  def commands
    # require 'pry'; binding.pry
    binary = BinaryBuilder.new.convert(@decimal)
    result = []
    binary.each do | val |
      result << COMMANDS[val]
    end
    # require 'pry'; binding.pry
    result
  end

end






class BinaryBuilder
  attr_accessor :numbers
  BINARY_MULTIPLYER = 2

  def initialize
    @numbers = []
  end

  def <<(series)
    raise ArgumentError, "1's and 0's only" unless valid_binary?(series)
    @numbers.push series
  end

  def select
    return @numbers.enum_for if !block_given?
    binary = BinaryBuilder.new
    each do | bi |
      binary << bi if yield(bi)
    end
    binary
  end

  def each
    return @numbers.enum_for if !block_given?
    counter = 0
    while counter < @numbers.size
      yield(@numbers[counter])
      counter += 1
    end
    self
  end


  def pop
    @numbers.pop
  end

  def []=(idx, value)
    raise ArgumentError, "1's and 0's only" unless valid_binary?(series)
    @numbers[idx] = value
  end

  def [](idx)
    @numbers[idx]
  end

  def decimal_value
    value = 0
    @numbers.reverse.each.with_index do | n, idx |
      value += index_value(idx) if n == 1
    end
    value
  end

  def convert digit
    values = []
    loop do
      remainder = nearest_power_of_2(digit)
      values << remainder
      digit = digit - remainder
      break unless digit > 0
    end
    convert_to_binary_form(values)
  end

  def to_s
    result = ''
    @numbers.each do | v |
      result << v + ' '
    end
    result
  end

  private

  def index_value(idx)
    BINARY_MULTIPLYER ** idx
  end

  def convert_to_binary_form(digits)
    # require 'pry'; binding.pry
    digits.each do | n |
      bi_value = []
      (0..n).collect.with_index do | idx |
        bi_value[idx] =
          if n == index_value(idx)
            1
          elsif index_value(idx) < n
            0
        end
      end
      # require 'pry'; binding.pry
      @numbers << bi_value.compact!.join('').reverse
    end
    self
  end

  def nearest_power_of_2 number
    return 0 if number <= 0
    exponent = Math.log2 number
    BINARY_MULTIPLYER ** exponent.floor
  end

  def valid_binary?(series)
    series.chars.all? { | n | n == '1' || n == '0' }
  end
end



shake = SecretHandshake.new(8)
p shake.commands
# b = BinaryBuilder.new
# b.convert 8
# puts b
# bi_obj = b.select do | e |
#   e == "1"
# end
# puts bi_obj
