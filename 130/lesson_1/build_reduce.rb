def reduce(arr, accum = nil)
  counter = 0
  if !accum
    a = 0
  else
    a = accum
  end
  while counter < arr.size
    temp = arr[counter, 2]
    break if temp.size == 1
    n,n1 = temp
    n = a if a != 0
    a = yield(n,n1)
    counter += 1
  end
  a
end




array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }   #15
p reduce(array, 10) { |acc, num| acc + num } #25
# reduce(array) { |acc, num| acc + num if num.odd? } #NoMethodError
