def select(arr)
  counter = 0
  result = []
  if block_given?
    while counter < arr.size
      result << arr[counter] if yield(arr[counter])
      counter += 1
    end
      return result
  else
    return arr.enum_for
  end

end


 p select([1,2,3,4,5,6,7,8]){ |n| n > 4 }
 array = [1, 2, 3, 4, 5]
 p select(array) { |num| num.odd? }
 p select(array) { |num| puts num }
 p select(array) { |num| num + 1 }

 p select(array)
