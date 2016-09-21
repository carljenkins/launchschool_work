class Series
  attr_accessor :series

  def initialize(series)
    @series = series
  end

  def slices(n)
    raise ArgumentError unless series.size >= n
    result = []
    arry_values = []
    for i in 0..series.size - 1 do
      values = series[ i,  n]
      arry_values << values.chars.to_a
    end
    arry_values.each{|a| result << a.map(&:to_i)}
    result.delete_if{|a| a.count < n}
  end
end
