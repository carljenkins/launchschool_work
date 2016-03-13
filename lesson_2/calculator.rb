#ask the user for two numbers
#ask the user for an operation to perform
#perform the operation on the two numbers
#out put the result

puts("Bleep Bloop Welcome to CLI Calculator!")

puts("What is the first nubmer?")
first_number = gets.chomp

puts("What's the second number?")
second_number = gets.chomp

puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = gets.chomp
if(operator != "4" && second_number != "0")
  if operator == "1"
    result = first_number.to_i + second_number.to_i
  elsif operator == "2"
    result = first_number.to_i - second_number.to_i
  elsif operator == "3"
    result = first_number.to_i * second_number.to_i
  else
    result = first_number.to_f / second_number.to_i
  end
else
  result = "Unable to divide by zero!"
end
puts("The result is #{result}")
