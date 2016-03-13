# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# out put the result

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(number)
  number.to_i != 0
end

def operation_to_message(operator)
  case operator
  when operator == '1'
    "Adding"
  when operator == '2'
    "Subtracting"
  when operator == '3'
    "Multiplying"
  when operator == '4'
    "Dividing"
  end
end

prompt("Bleep Bloop Welcome to CLI Calculator! Enter your name:")
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi! #{name}")

loop do
  first_number = ''
  second_number = ''

  loop do
    prompt("What's the first number?")
    first_number = gets.chomp
    if (valid_number?(first_number))
      break
    else
      prompt("Hmm...that doens't look like a valid number")
    end
  end

  loop do
    prompt("What's the second number?")
    second_number = gets.chomp
    if (valid_number?(second_number))
      break
    else
      prompt("Hmm...that doens't look like a valid number")
    end
  end

operator = ''
operator_prompt = <<-MSG
  What operation would you like to perform?
  1 add
  2 subtract
  3 multiply
  4 divide
MSG

prompt(operator_prompt)

loop do
  operator = gets.chomp
  if %w(1 2 3 4).include?(operator)
    break
  else
    prompt("Please choose 1 2 3 or 4")
  end
end

prompt("#{operation_to_message(operator)} the two numbers.")

result = case operator
         when '1'
           first_number.to_i + second_number.to_i
         when '2'
           first_number.to_i - second_number.to_i
         when '3'
           first_number.to_i * second_number.to_i
         when '4'
           first_number.to_f / second_number.to_i
         end

  prompt("The result is: #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt("Thanks for using the CLI calculator!")
