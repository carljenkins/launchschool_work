
# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
# 10000 = Reverse the order of the operations in the secret handshake.
# 128 - 64 - 32 - 16 - 8 - 4 - 2 - 1
class SecretHandshake

  BASE_2 = 2
  COMMANDS = %w[wink double\ blink close\ your\ eyes jump]

  def initialize(code)
    @secret_code = code
  end

  def commands
    return [] unless @secret_code.is_a? Integer
    binary = @secret_code.to_s(BASE_2)
    require 'pry'; binding.pry
    # binary.reverse! if binary.chars.size >= 5
    indexs = positions(binary).compact
    require 'pry'; binding.pry

    p indexs
    arry = []
    indexs.each do | val |
      arry << COMMANDS.values_at(val)
    end
    arry.flatten
  end

  private

  def positions(binary)
    binary.chars.reverse.map.with_index{ | d, i |  i if d == '1'}
  end

end

# s = SecretHandshake.new(1)
# p s.commands
# s = SecretHandshake.new(2)
# p s.commands
# s = SecretHandshake.new(4)
# p s.commands
# s = SecretHandshake.new(8)
# p s.commands
# s = SecretHandshake.new(3)
# p s.commands
s = SecretHandshake.new(19)
p s.commands
# 'double blink', 'wink'


  # expected = ['jump', 'close your eyes', 'double blink', 'wink']
