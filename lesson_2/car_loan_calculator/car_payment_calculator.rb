require 'pry'
require 'yaml'

LANGUAGE = 'en'

MESSAGES = YAML.load_file('car_payment_messages.yml')

def calc_monthly_interest(apr)
  (apr.to_f / 100) / 12
end

def calculate_payment(loan_amt, monthly_interest, duration)
  payment = loan_amt.to_i * (monthly_interest.to_f * ((1 + monthly_interest.to_f)**duration.to_i)) /
            (((1 + monthly_interest.to_f)**duration.to_i) - 1)
  payment.round(2)
end

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def number?(number)
  /^\d+$/.match(number) || /^\d*\.?\d*$/.match(number)
end

prompt(messages('welcome'))

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(messages('valid_name'))
  else
    break
  end
end

prompt("Hi #{name}!")

loan_amt = ''

loop do
  prompt(messages('request_loan_amt'))
  loan_amt = gets.chomp
  if (number?(loan_amt))
    break
  else
    prompt(messages('check_number'))
  end
end

apr = ''

loop do
  prompt(messages('apr'))
  apr = gets.chomp
  apr.sub!(/%$/, '') if apr.include?('%')
  if number?(apr)
    break
  else
    prompt(messages('check_number'))
  end
end

duration = ''

loop do
  prompt(messages('duration'))
  duration = gets.chomp
  if (number?(duration))
    break
  else
    prompt(messsages('check_number'))
  end
end

payment = calculate_payment(loan_amt, calc_monthly_interest(apr), duration)

prompt(messages('monthly_payment').concat(" #{payment}"))
