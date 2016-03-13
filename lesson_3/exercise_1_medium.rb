require 'pry'

#Question 1
# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

10.times{ |x| puts " " * x + "The Flintstones Rock!" }


#Question 2
statement = "The Flintstones Rock"
occurs = Hash.new(0)
statement.each_char{|letter|  occurs[letter] += 1 }
p occurs

#Question 3
#This code results in an error becuase we are trying to add a string
# to a fixnum result.
# puts "the value of 40 + 2 is " + (40 + 2)
#we can fix this by calling to_s on the additional_ages
puts "the value of 40 + 2 is " + (40 + 2).to_s
#Or using string interpolation
puts "the value of 40 + 2 is #{(40 + 2)}"

#Question 4
#This code will print the nubmers 1 and 3 from the array.
# This is because the shift method modifies the array and remvoes 2 and 4
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

#The output of this code is the nubmer 1 & 2 becuase the pop
#method then removes the number 4 and then the number 3
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

#Question 5
#Change the loop by using the while loop instead of begin
# The purpose of number % dividend is to determine if they number is
#evenly divisible.
#The purpose of the divisors expression before the last end is so
#Ruby returns the array of divisors from the method.
def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end


def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

#Question 6
#rolling_buffer1 modifies the buffer argument due to using the << operator.
#rolling_buffer2 does not modify the caller.
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

# def rolling_buffer2(input_array, max_buffer_size, new_element)
#   binding.pry
#   buffer = input_array + [new_element]
#   binding.pry
#   buffer.shift if buffer.size >= max_buffer_size
#   binding.pry
#   buffer
# end


#Question 7
#The limit varaible is not available within the fib method
# limit = 15
#
# def fib(first_num, second_num)
#   while second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end
#
# result = fib(0, 1)
# puts "result is #{result}"
#

#Question 8
#To mimic the titleize method in Rails we coudl use something like this.
title = "this is the title to my story"
p title.split(' ').each{|word| word.capitalize!}.join(' ')

#Question 9
# I had to look at the solution. I was close! but I still peeked.d
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


munsters.each do |key,value|
    case value['age']
    when 0..17
      value.merge!({"age_group" => 'kid'})
    when 18..64
      value.merge!({"age_group" => 'adult'})
    when 65..1000
      value.merge!({"age_group" => 'senior'})
    end
end

p munsters
