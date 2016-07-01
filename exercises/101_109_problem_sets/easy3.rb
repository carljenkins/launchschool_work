require 'pry'
# #
# # #Searching 101
# # puts "Searching 101"
# # puts "------------------------"
# nums=[]
# attempts=["1st", "2nd", "3rd", "4th", "5th", "last"]
#
# def number?(number)
#   /^\d+$/.match(number) || /^\d*\.?\d*$/.match(number)
# end
#
# def check_for_validity(v)
#   ret = ""
#   loop do
#     puts "That's not a number. Try again."
#     ret=gets.chomp
#     if number?(ret)
#       break
#     end
#   end
#   ret
# end
#
# attempts.each do |a|
#   puts "Please enter the #{a} number."
#   input = gets.chomp
#   if number?(input)
#     nums << input
#   else
#     nums << check_for_validity(input)
#   end
#   # p nums
# end
#
# check_digit=nums.pop
# if nums.include?(check_digit)
#   puts "The number #{check_digit} does appear in #{nums}"
# else
#   puts "The number #{check_digit} does not appear in #{nums}"
# end
#
# # puts
# # puts "------------------------"



#
# # #Arithmetic Integer
# # puts "Arithmetic Integer"
# # puts "------------------------"
# puts "Please enter the first digit."
# digit1=gets.chomp.to_i
#
# puts "Please enter the second digit."
# digit2=gets.chomp.to_i
#
# #addition
# puts "#{digit1} + #{digit2} = #{digit1 + digit2}"
# #subtraction
# puts "#{digit1} - #{digit2} = #{digit1 - digit2}"
# #multiplication
# puts "#{digit1} * #{digit2} = #{digit1 * digit2}"
#
# #division
# puts "#{digit1} / #{digit2} = #{digit1 / digit2}"
# #modulo
# puts "#{digit1} % #{digit2} = #{digit1 % digit2}"
# #power
# puts "#{digit1} ** #{digit2} = #{digit1 ** digit2}"
#
# # puts
# # puts "------------------------"

# # #Counting the number of characters
# # puts "Counting the number of characters"
# # puts "------------------------"
# puts "Please enter a word or multiple words."
# input=gets.chomp
#
# puts "There are #{input.split('').count} characters in #{input}"
# # puts
# # puts "------------------------"

#
# # #Mutiplying two numbers
# # puts "Mutiplying two numbers"
# # puts "------------------------"
#
# def multiply(a, b)
#   a * b
# end
# #
# puts multiply(5.2, 3)
#
# # puts
# # puts "------------------------"
#


# #Squaring an argument
# puts "Squaring an argument"
# puts "------------------------"
# def square(n)
#   multiply(n,n)
# end
#
# puts square(5)
# puts square(-8)
# puts
# puts "------------------------"



# # #Exclusive OR
# # puts "Exclusive OR"
# # puts "------------------------"
#
# def xor?(a, b)
#   return true if a && !b
#   return true if b && !a
#   false
# end
#
# puts xor?(5.even?, 4.even?)
# puts xor?(5.odd?, 4.odd?)
# puts xor?(5.odd?, 4.even?)
# puts xor?(5.even?, 4.odd?)
#
# # puts
# # puts "------------------------"




# #Odd Lists
# puts "Odd Lists"
# puts "------------------------"

# def oddities(arry)
#   result=[]
#   arry.each_with_index do |k,i|
#     result << k if i % 2 == 0
#   end
#   result
# end
#
# p oddities([2, 3, 4, 5, 6])
# p oddities(['abc', 'def'])
# p oddities([123])
# p oddities([])

# puts
# puts "------------------------"



# #Palindromic Strings Part 1
# puts "Palindromic Strings Part 1"
# puts "------------------------"


# puts
# puts "------------------------"
