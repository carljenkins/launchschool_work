# #Delete Vowels
# puts "Delete Vowels"
# puts "------------------------"
#
#
# def remove_vowels(vowels)
#     remoed_vowels = vowels.collect do |str|
#       str.gsub(/[aeiou]/i, '')
#     end
# end
#
#
# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #== %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) #== %w(grn YLLW blck wht)
#  p remove_vowels(%w(ABC AEIOU XYZ)) #== ['BC', '', 'XYZ']
#
#
# puts
# puts "------------------------"




# #Fibonacci Number Location By Length
# puts "Fibonacci Number Location By Length"
# puts "------------------------"
#
# def find_fibonacci_index_by_length(fib_size)
#   a = 0
#   b = 1
#   next_number = 0
#   loop_idx = 0
#   fibs = [0,1]
#   loop do
#     next_number = a + b
#     fibs << next_number
#     a = b
#     b = next_number
#     if fibs[loop_idx].to_s.size == fib_size
#       break
#     end
#     loop_idx +=1
#   end
#   loop_idx
# end
#
#
# p find_fibonacci_index_by_length(2) # == 7
# p find_fibonacci_index_by_length(10) #== 45
# p find_fibonacci_index_by_length(100) #== 476
# p find_fibonacci_index_by_length(1000) #== 4782
# p find_fibonacci_index_by_length(10000) #== 47847
#
# puts "------------------------"




# #Reversed Arrays Part 1
# puts "Reversed Arrays Part 1"
# puts "------------------------"
#
# def reverse_array!(arr)
#   left_index = 0
#   right_index = -1
#
#   while left_index < arr.size / 2
#
#     arr[left_index], arr[right_index] = arr[right_index], arr[left_index]
#     left_index += 1
#     right_index -= 1
#   end
#   arr
# end
# p reverse_array!([1,2,3,4])
#
# puts "------------------------"



# def merge(arr1, arr2)
#   (arr1 << arr2).flatten!.uniq
# end
#
#
#
# p merge([1,3,5],[3,6,9])


#
# #Halvsies
# puts "Halvsies"
# puts "------------------------"
#
# def halvsies(arr)
#   start = start_pos(arr)
#   left = get_arr_side(0, start, arr)
#   right = get_arr_side(start, arr.size - 1, arr)
#
#   [] << left << right
# end
#
# def start_pos(arr)
#   (arr.size % 2 == 0) ? (arr.size / 2) : (arr.size / 2) + 1
# end
#
# def get_arr_side(left, right, arr)
#   arr.slice(left, right) == nil ? [] : arr.slice(left, right)
# end
#
#  p halvsies [1,2,3,4] # [[1,2],[3,4]]
#  p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
#  p halvsies([5]) #== [[5], []]
# p halvsies([]) #== [[], []]
# puts "------------------------"
#





#
# #Find the Duplicate
# puts "Find the Duplicate"
# puts "------------------------"
#
# def find_dup(arr)
#  arr.find_all{ |x| arr.count(x) > 1}.uniq[0]
# end
#
# # p find_dup([1, 5, 3, 1]) #== 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58])
# puts "------------------------"



#Does my list include this?
puts "Does my list include this?"
puts "------------------------"

def include?(arr, e)
 !arr.keep_if {|x| x == e}.empty?
end


p include?([1,2,3,4,5], 3) #== true
p include?([1,2,3,4,5], 6) # == false
p include?([], 3) #== false
p include?([nil], nil) #== true
p include?([], nil)# == false

puts "------------------------"




