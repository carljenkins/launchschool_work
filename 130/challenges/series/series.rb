class Series
  attr_accessor :series

  def initialize(series)
    @series = series
  end

  def slices(n)
    slices = []
    for i in 0..series.size - 1 do
      slices << series[ i,  n]
    end
    slices
  end

end


s = Series.new('01234')
p s.slices(2)
