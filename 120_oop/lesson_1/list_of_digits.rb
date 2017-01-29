
def digit_list(num)
  arr = []
  num.to_s.chars.each do |e|
    arr << e.to_i
  end
  arr
end


puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]