require 'pry'
#Question 1
# My inital answer to this was wrong. I was expecting the last line to be simply
# the word 'hi'. After reading the solution and studying the code again.
# I sort of see why the answer is 'hi there' instead of just 'hi'.
# It seems the assingment of gettings[:a] to informal_greeting creates a pointer
# to the String object 'hi' inside the hash and not creating a new object.
# This seems to be why the << method is able to modify the orignal object.
if false
  greeting = “hello world”
end
 greeting


#Question 2
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings


#Question 3
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one
puts "two is: #{two}" #two
puts "three is: #{three}" #three

puts


def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #one
puts "two is: #{two}" #two
puts "three is: #{three}" #thee

puts


def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"  #two
puts "two is: #{two}"  #three
puts "three is: #{three}" #one


#Question 4
# here is my method for generating a uuid
def generate_uuid
  uuid = ""
  numbers = 0..9
  letters = "a".."f"
  pattern = [8,4,4,4,12]
  all_values = (numbers.to_a << letters.to_a).flatten!

  pattern.each do |value|
    value.times do
      uuid << all_values.shuffle.sample.to_s
    end
    uuid << '-' if value < 12
  end
  uuid
end


puts generate_uuid

def is_a_number?(number)
  /^\d+$/.match(number) || /^\d*\.?\d*$/.match(number)
end
#Question 5
def dot_separated_ip_address?(input_string)

  dot_separated_words = input_string.split(".")

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false if (!is_a_number?(word) || dot_separated_words.size >= 4)
  end
   true
end

puts dot_separated_ip_address?("10.1.1.1")
puts dot_separated_ip_address?("10.1.1.test")
puts dot_separated_ip_address?("10.1.1.1.3")
