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



#Running Totals
puts "Running Totals"
puts "------------------------"

puts
puts "------------------------"

