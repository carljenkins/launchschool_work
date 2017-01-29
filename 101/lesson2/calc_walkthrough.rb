# ask the user for two numbers
# ask the user for an operation
# perform the operation on the nubmers
# output the result

puts "Welcome to CLI calculator"

puts "What's the first number?"
num1 = gets.chomp

puts "What's the second number?"
num2 = gets.chomp


puts "What operation would like? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

if operator == '1'
  result = num1.to_i + num2.to_i
elsif operator ==  '2'
    result = num1.to_i - num2.to_i
elsif operator == '3'
  result = num1.to_i * num2.to_i
else
  result = num1.to_f / num2.to_f
end

puts "Your result is #{result}"


