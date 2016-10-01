class SecretHandshake

  BASE_2 = 2
  COMMANDS = %w[wink double\ blink close\ your\ eyes jump]

  def initialize(code)
    @secret_code = code
  end

  def commands
    return [] unless @secret_code.is_a? Integer
    binary = @secret_code.to_s(BASE_2)

    arry = []
    command_indexes(binary).each do | val |
      arry << COMMANDS.values_at(val)
    end
    binary.size >= 5 ? arry.flatten.reverse.compact : arry.flatten
  end

  private

  def positions(binary)
    binary.chars.reverse.map.with_index{ | d, i |  i if d == '1'}
  end

  def command_indexes(binary)
    indexs = positions(binary).compact
  end
end
