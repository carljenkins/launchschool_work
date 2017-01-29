# ask the user for two numbers
# ask the user for an operation
# perform the operation on the nubmers
# output the result

require 'yaml'

LANGUAGE = 'en'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end



def valid_number?(number)
  /\d/.match(number) && /^\d*\.?\d*$/.match(number)
end

def operation_to_message(op)
  case op
  when '1'
    messages 'add'
  when '2'
    messages'subtract'
  when '3'
    messages 'multiply'
  when '4'
    messages 'divide'
  end
end

prompt('welcome')

name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?
    prompt messages('valid_name')
  else
    break
  end
end

puts "Hi #{name}!"

loop do
  num1 = ''

  loop do
    prompt 'first_number'
    num1 = Kernel.gets.chomp
    if valid_number?(num1)
      break
    else
      prompt('invalid_number')
    end
  end

  num2 = ''
  loop do
    prompt('second_number')
    num2 = Kernel.gets().chomp()
    if valid_number?(num2)
      break
    else
      prompt('invalid_number')
    end
  end


  prompt('operator_prompt')

  operator = ''

  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  puts ("#{operation_to_message(operator)} the two numbers")

  result = case operator
           when '1'
             num1.to_i() + num2.to_i()
           when '2'
             num1.to_i() - num2.to_i()
           when '3'
             num1.to_i() * num2.to_i()
           when '4'
             num1.to_f() / num2.to_f()
           end

  puts("Your result is #{result}")
  prompt 'another_calc'
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end
