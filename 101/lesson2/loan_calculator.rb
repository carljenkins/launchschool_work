require 'yaml'
require 'pry'

LANGUAGE = 'en'
MESSAGES = YAML.load_file('loan_calc_messages.yml')

def messages(key, lang = 'en')
  MESSAGES[lang][key]
end

def prompt(key)
  msg = messages(key, LANGUAGE)
  puts "=> #{msg}"
end

def valid_number?(number)
  is_integer?(number) && is_float?(number)
end

def is_integer?(number)
  /\d/.match(number)
end

def is_float?(number)
  /^\d*\.?\d*$/.match(number)
end

def monthly_interest_rate(apr)
  ((apr / 100.0) / 12.0)
end

def calculate_payment(loan_amt, mnthly_interest_rate, duration)
  pyment = loan_amt * 
    (mnthly_interest_rate / 
      (1 - ((1 + mnthly_interest_rate)** -duration)))

  pyment.round(2)
end

prompt 'welcome'

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt 'invalid_name'
  else
    break
  end
end

puts "Hi #{name}"

loop do
  loan_amt = ''
  loop do
    prompt 'loan_amt'
    loan_amt = gets.chomp
    if valid_number?(loan_amt)
      break
    else
      prompt 'invalid_number'
    end
  end

  apr = ''
  loop do
    prompt 'apr'
    apr = gets.chomp
    if is_integer?(apr)
      break
    else
      prompt 'invalid_number'
    end
  end

  loan_duration = ''
  loop do
    prompt 'loan_duration'
    loan_duration = gets.chomp
    if is_integer?(loan_duration)
      break
    else
      prompt 'invalid_number'
    end
  end

  monthly_rate = monthly_interest_rate(apr.to_i)

  payment = calculate_payment(loan_amt.to_i, monthly_rate, loan_duration.to_i)

  prompt 'payment_info'
  print "$#{format('%02.2f', payment)}"
  puts

  prompt 'another_calculation'
  response = gets.chomp
  break unless response.downcase.include?('y')
end
