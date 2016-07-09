require 'pry'
# #Short long short
# puts "Short long short"
# puts "------------------------"
#
# def short_long_short(str1, str2)
#   start = ''
#   middle = ''
#   end_word=''
#
#   if (str1.length > str2.length)
#     return  str2 + str1 + str2
#   else
#     return str1 + str2 + str1
#   end
#
# end
#
# puts short_long_short('abc', 'defgh') #== "abcdefghabc"
# puts short_long_short('abcde', 'fgh') #== "fghabcdefgh"
# puts short_long_short('', 'xyz')# == "xyz"
#
# puts
# puts "------------------------"
#



# #What Centurn is that?
# puts "#What Century is that?"
# puts "------------------------"
#
#
# def century(year)
#   century = year / 100 + 1
#   century -= 1 if year % 100 == 0
#   century.to_s + century_suffix(century)
# end
#
# def century_suffix(century)
#   return 'th' if [11, 12, 13].include? century % 100
#   last_digit = century % 10
#
#   case last_digit
#     when 1 then 'st'
#     when 2 then 'nd'
#     when 3 then 'rd'
#     else 'th'
#   end
# end
#
#
#
# puts
# puts "------------------------"


#
# #Leap Years (part 1)
# puts "#Leap Years (part 1)"
# puts "------------------------"
#
# def leap_year?(year)
#
#   #is leap year if divisible by 4 unless it's also divisible by 100.
#   #then it's not a leap year unless it's also divisible by 400
#
#    return (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)
#
#
#
# end
#
# puts leap_year?(2016) #== true
# puts leap_year?(2015)# == false
# puts leap_year?(2100)# == false
# puts leap_year?(2400)# == true
# puts leap_year?(240000)# == true
# puts leap_year?(240001)# == false
# puts leap_year?(2000) #== true
# puts leap_year?(1900)# == false
# puts leap_year?(1752)# == true
# puts leap_year?(1700)# == false
# puts leap_year?(1) #== false
# puts leap_year?(100) #== false
# puts leap_year?(400) #== true
#
# puts
# puts "------------------------"


# #Leap Years (part 2)
# puts "#Leap Years (part 2)"
# puts "------------------------"
#
# def leap_year?(year)
#   return true if (year < 1752) && (year % 4 == 0)
#   #is leap year if divisible by 4 unless it's also divisible by 100.
#   #then it's not a leap year unless it's also divisible by 400
#
#  return (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)
#
# end
#
#
# puts leap_year?(2016) #== true
# puts leap_year?(2015) #== false
# puts leap_year?(2100)# == false
# puts leap_year?(2400) #== true
# puts leap_year?(240000)# == true
# puts leap_year?(240001)# == false
# puts leap_year?(2000)# == true
# puts leap_year?(1900)# == false
# puts leap_year?(1752)# == true
# puts leap_year?(1700)# == true
# puts leap_year?(1) #== false
# puts leap_year?(100)# == true
# puts leap_year?(400)# == true
#
#
# puts
# puts "------------------------"


#
# #Multiples of 3 and 5
# puts "Multiples of 3 and 5"
# puts "------------------------"
#
# def multisum(num)
#   sum = 0
#   1.upto(num) do |e|
#     sum += e if (e % 3 == 0) || (e % 5 == 0)
#   end
#   sum
# end
#
#
# puts multisum(3)# == 3
# puts multisum(5) #== 8
# puts multisum(10) #== 33
# puts multisum(1000) #== 234168
#
# puts
# puts "------------------------"



# #Running Totals
# puts "Running Totals"
# puts "------------------------"

# def running_total(arr)
#   total = 0
#   ret_arr = []
#   arr.each_with_index do |e,i|
#     #binding.pry
#     if (i == 0)
#       total += e
#       ret_arr << total
#       #binding.pry
#     else
#       #binding.pry
#       total += e
#       #binding.pry
#       ret_arr << total
#       #binding.pry
#     end
#   end
#   ret_arr
# end


# p running_total([2, 5, 13])# == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
# p running_total([3]) #== [3]
# p running_total([])#   == []
# puts
# puts "------------------------"


# #Convert a String to a number
# puts "Convert a String to a number"
# puts "------------------------"


# DIGITS = {"0" => 1, "1" => 1, "2" => 2, "3" => 3, "4" => 4 , "5" => 5, "6" => 6, "7" => 7, "8" => 8 , "9" => 9}

# def string_to_integer(param)
#   digits = param.chars.map {|e|  DIGITS[e] }
  
#   value = 0
#   digit = digits.each {| n |  value = value * 10 + n   }
  
#   value
# end

# string_to_signed_integer('4321') #== 4321
# string_to_signed_integer('570') #== 570
# string_to_signed_integer('100') #== 100
# puts
# puts "------------------------"



# #Convert a String to a signed number
# puts "Convert a String to a signed number"
# puts "------------------------"



# DIGITS = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4 , "5" => 5, "6" => 6, "7" => 7, "8" => 8 , "9" => 9}

# def string_to_integer(param)
#   digits = param.chars.map {|e|  DIGITS[e] }
  
#   value = 0
#   digit = digits.each {| n |  value = value * 10 + n   }
  
#   value
# end

# def string_to_signed_integer(param)
#   case param[0]
#   when '-' then -string_to_integer(param[1..-1])
#   when '+' then string_to_integer(param[1..-1])
#   else string_to_integer(param)
#   end
# end

# p string_to_signed_integer('4321') #== 4321
# p string_to_signed_integer('-570') #== -570
# p string_to_signed_integer('+100') #== 100

# puts
# puts "------------------------"






# #Convert a String to a signed number
# puts "Convert a String to a signed number"
# puts "------------------------"



# DIGITS = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4 , "5" => 5, "6" => 6, "7" => 7, "8" => 8 , "9" => 9}

# def string_to_integer(param)
#   digits = param.chars.map {|e|  DIGITS[e] }
  
#   value = 0
#   digit = digits.each {| n |  value = value * 10 + n   }
  
#   value
# end

# def string_to_signed_integer(param)
#   case param[0]
#   when '-' then -string_to_integer(param[1..-1])
#   when '+' then string_to_integer(param[1..-1])
#   else string_to_integer(param)
#   end
# end

# p string_to_signed_integer('4321') #== 4321
# p string_to_signed_integer('-570') #== -570
# p string_to_signed_integer('+100') #== 100

# puts
# puts "------------------------"









# #Convert number to a String
# puts "Convert number to a String"
# puts "------------------------"

# DIGITS = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4 , "5" => 5, "6" => 6, "7" => 7, "8" => 8 , "9" => 9}

# def integer_to_string(param)
 
#   result = []
#   i = param
#   while i > 0
#     digit = i % 10
#     i /= 10
#     result.unshift(DIGITS.key(digit)) 
#   end
# result.join
# end

# p integer_to_string(4321) #== '4321'
# p integer_to_string(0)# == '0'
# p integer_to_string(5000) #= '5000'

# puts
# puts "------------------------"




# #Convert number to a String
# puts "Convert number to a String"
# puts "------------------------"

# DIGITS = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4 , "5" => 5, "6" => 6, "7" => 7, "8" => 8 , "9" => 9}

# def integer_to_string(param)
 
#   result = []
#   i = param
#   while i > 0
#     digit = i % 10
#     i /= 10
#     result.unshift(DIGITS.key(digit)) 
#   end
# result.join
# end

# p integer_to_string(4321) #== '4321'
# p integer_to_string(0)# == '0'
# p integer_to_string(5000) #= '5000'

# puts
# puts "------------------------"




# #Convert a Signed Number to a String!
# puts "Convert a Signed Number to a String!"
# puts "------------------------"

# DIGITS = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4 , "5" => 5, "6" => 6, "7" => 7, "8" => 8 , "9" => 9}

# def integer_to_string(param)
 
#   result = []
#   i = param
#   # binding.pry
#   while i > 0
#     digit = i % 10
#     i /= 10
#     result.unshift(DIGITS.key(digit)) 
#   end
#   result << DIGITS.key(param) if param == 0
#   ret_string = result.join
#   ret_string
# # binding.pry
# end


# def signed_integer_to_string(param)
#   case param <=> 0
#   when +1 then  "+#{integer_to_string(param)}"
#   when -1 then "-#{integer_to_string(-param)}"
#   else          integer_to_string(param)
#   end
# end

# p signed_integer_to_string(4321) #== '+4321'
# p signed_integer_to_string(-123) #== '-123'
# p signed_integer_to_string(0) #== '0'

# puts
# puts "------------------------"





# #Ascii String value
# puts "Ascii String value"
# puts "------------------------"

# def ascii_value(param)
#   total = 0
#   param.chars.each {|c| total += c.ord   }
#   total
# end

# p ascii_value('Four score')# == 984
# p ascii_value('Launch School') #== 1251
# p ascii_value('a') #== 97
# p ascii_value('')#== 0

# puts
# puts "------------------------"



# #After midnight part 1
# puts "After midnight part 1"
# puts "------------------------"

# def time_of_day(minutes)

# end

# time_of_day(0) #== "00:00"
# time_of_day(-3) #== "23:57"
# time_of_day(35) #== "00:35"
# time_of_day(-1437)# == "00:03"
# time_of_day(3000) #== "02:00"
# time_of_day(800) #== "13:20"
# time_of_day(-4231) #== "01:29"

# puts
# puts "------------------------"






# #Letter Swap
# puts "Letter Swap"
# puts "------------------------"


# def swap(str)
#   ret_wrds = 
#     str.split(' ').map do |wrd|
#       hold = wrd[-1]
#       wrd[-1] = wrd[0]
#       wrd[0] = hold
#       wrd
#   end
#   ret_wrds.join(' ')
# end

# p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') #== 'ebcdA'
# p swap('a') #== 'a'

# puts
# puts "------------------------"





#Clean up the words
puts "Clean up the words"
puts "------------------------"

def cleanup(str)
  str.gsub(/[^a-zA-Z0-9_]+/, ' ') 
end

p cleanup("---what's my +*& line?") #== ' what s my line '

puts
puts "------------------------"