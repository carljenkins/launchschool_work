# #Combine two lists
# puts "Combine two lists"
# puts "------------------------"

# def interleave(arr1, arr2)
#  arr1.zip(arr2).flatten
# end
#
#
#p  interleave([1, 2, 3], ['a', 'b', 'c'])  #== [1, 'a', 2, 'b', 3, 'c']


# #Interleave two arrays
# puts "Interleave two arrays"
# puts "------------------------"
#
# def interleave2(arr1, arr2)
#   result = []
#   count = 0
#   loop do
#     result << arr1[count] << arr2[count]
#     count += 1
#     break if count == arr2.size
#   end
#   result
#
#
# end
#
#
# p interleave2([1, 2, 3], ['a', 'b', 'c'])  #== [1, 'a', 2, 'b', 3, 'c']
# puts "------------------------"


#
# #Lettercase counter
# puts "Lettercase counter"
# puts "------------------------"
#
# def letter_case_count(str)
#
#   lower = str.to_enum(:scan, /[[:lower:]]/).map { $& }
#   upper = str.to_enum(:scan, /[[:upper:]]/).map { $& }
#   neither = str.to_enum(:scan, /[^a-zA-Z]/).map { $& }
#   lowercase = lower.flatten.size
#   uppercase = upper.flatten.size
#   neither = neither.flatten.size
#   {lowercase: lowercase, uppercase: uppercase, neither: neither}
#
# end
#
#
# puts letter_case_count('abCdef 123') #== { lowercase: 5, uppercase: 1, neither: 4 }
# puts letter_case_count('AbCd +Ef') #== { lowercase: 3, uppercase: 3, neither: 2 }
# puts letter_case_count('123') #== { lowercase: 0, uppercase: 0, neither: 3 }
# puts  letter_case_count('') #== { lowercase: 0, uppercase: 0, neither: 0 }
# puts "------------------------"


# #Capitalize Words
# puts "Capitalize Words"
# puts "------------------------"
#
# def word_cap(str)
#   str.split(' ').each { |word| word.capitalize! }.join(' ')
# end
#
# puts word_cap('four score and seven') #== 'Four Score And Seven'
# puts word_cap('the javaScript language') #== 'The Javascript Language'
# puts word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'
#
#
# puts "------------------------"



# #Swap Case
# puts "Swap Case"
# puts "------------------------"

# def swapcase(str)
#  str.swapcase
# end


#
# def swapcase(string)
#   new_string = ''
#   string.each_char do |char|
#     char =~ /[A-Z]/ ? new_string << char.downcase : new_string << char.upcase
#   end
#   new_string
# end
#
# puts swapcase('CamelCase') #== 'cAMELcASE'
# puts swapcase('Tonight on XYZ-TV') #== 'tONIGHT ON xyz-tv'
# puts "------------------------"




# #Staggered Caps (Part 1)
# puts "Staggered Caps (Part 1)"
# puts "------------------------"
#
# def staggered_case(str)
#   result = ""
#
#   str.each_char.with_index(1) do |letter, idx |
#     result << (idx.odd? ? letter.upcase : letter.downcase)
#   end
# result
# end
#
#
# puts staggered_case('I Love Launch School!') #== 'I LoVe lAuNcH ScHoOl!'
# puts staggered_case('ALL_CAPS') #== 'AlL_CaPs'
# puts staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 NuMbErS'
# puts "------------------------"


#
# #Staggered Caps (Part 2)
# puts "Staggered Caps (Part 2)"
# puts "------------------------"
#
# def staggered_case(str)
#
#
# end
#
#
# staggered_case('I Love Launch School!') #== 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') #== 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 nUmBeRs'
# puts "------------------------"




# #Multiplicative Average
# puts "Multiplicative Average"
# puts "------------------------"
#
# def show_multiplicative_average(ints)
#   result = (ints.inject(:*) / ints.size.to_f)
#   "The result is #{sprintf("%.3f", result)}"
# end
#
#
# puts show_multiplicative_average([3, 5])
# #The result is 7.500
#
# puts show_multiplicative_average([2, 5, 7, 11, 13, 17])
# #The result is 28361.667
# puts "------------------------"


# #Multiply Lists
# puts "Multiply Lists"
# puts "------------------------"
#
# def multiply_list(arr1, arr2)
#   result = []
#   arr1.each_with_index do |num, idx|
#     result << num * arr2[idx]
#   end
#   result
#
#   # p arr1.zip(arr2).map{|ca| ca[0] * ca[1]}
# end
#
# p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
#
# puts "------------------------"



#
# #Multiply All Pairs
# puts "Multiply All Pairs"
# puts "------------------------"
#
# def multiply_all_pairs(arr1, arr2)
#   arr1.product(arr2).map{ |p| p[0] * p[1] }.sort
# end
#
# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]
#
# puts "------------------------"




# #The End is Near But Not Here
# puts "The End is Near But Not Here"
# puts "------------------------"
#
# def penultimate(str)
#   str.split(' ')[-2]
# end
#
#
# p penultimate('last word') #== 'last'
# p penultimate('Launch School is great!') #== 'is'
# puts "------------------------"





