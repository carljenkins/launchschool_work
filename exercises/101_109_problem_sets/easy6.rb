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
#
# def find_fibonacci_index_by_length(idx)
#
#
#
# end
#
#
# p find_fibonacci_index_by_length(2) # == 7
# puts
# puts "------------------------"



#
#
# #Reversed Arrays Part 1
# puts "Reversed Arrays Part 1"
# puts "------------------------"
#
# def reverse(myarr)
#    ret_arr = []
#    idx = myarr.size
#    while idx != 0 do
#      ret_arr << myarr.pop
#      idx -= 1
#    end
#
#   ret_arr
# end
# list = [1,2,3,4]
# p reverse(list)
# p list
# puts "------------------------"



def merge(arr1, arr2)
  (arr1 << arr2).flatten!.uniq
end



p merge([1,3,5],[3,6,9])
