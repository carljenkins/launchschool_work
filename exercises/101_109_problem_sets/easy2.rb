#
# #How old is Teddy?
# puts "How old is Teddy?"
# puts "------------------------"
# default_name="Teddy"
# age = rand(20..200)
#
# puts "Please enter a name."
# name = gets.chomp
# name = default_name if name.empty?
#
# puts "#{name}'s age is #{age}"
#
# puts
# puts "------------------------"
#
#
#
# #How big is the room?
# puts "How big is the room?"
# puts "------------------------"
#
# feet_in_meter=10.7639
#
# puts "Please enter the length of the room in meters."
# len_meters=gets.chomp.to_i
#
# puts "Now enter the width of the room in meters."
# width_meters=gets.chomp.to_i
#
# total=len_meters * width_meters
# puts "The area of the room is #{total} square meters (#{total * feet_in_meter} square feet)"
# puts
# puts "------------------------"


# #Tip Calculator?
# puts "Tip Calculator"
# puts "------------------------"
# puts "What is the bill amount?"
# bill_amt=gets.chomp.to_i
#
# puts "Enter the tip rate?"
# tip_rate=gets.chomp.to_f
#
# tip_total=bill_amt * (tip_rate/100)
#
# total_bill= bill_amt + tip_total
#
# puts "The tip is #{tip_total}"
# puts "The bill total is #{total_bill}"
# puts
# puts "------------------------"



# #When will I retire?
# puts "When will I retire"
# puts "------------------------"
# puts "What is your age?"
# age=gets.chomp.to_i
#
# puts "What age would you like to retire?"
# retire_age=gets.chomp.to_i
#
# years_to_retirement=retire_age - age
# current_year=Time.now.year
#
#
# puts "It's #{current_year}. You will reture in #{current_year + years_to_retirement}"
# puts "You only have #{years_to_retirement} years left!"
# puts
# puts "------------------------"


# #Getting a user
# puts "Getting a user"
# puts "------------------------"
# puts "Hi, what's your name?"
# name = gets.chomp
# greeting=""
#
# if name.include?("!")
#   name.delete!("!")
#   greeting="Hello #{name}. why are we screaming?".upcase
# else
#    greeting="Hello #{name}."
# end
#
# puts greeting
# puts
# puts "------------------------"


# #Odd Numbers
# puts "Odd Numbers"
# puts "------------------------"
# (1..99).each {|n| puts n if n % 2 == 1}
#
# puts
# puts "------------------------"
#
# #Odd Numbers - bonus
# puts "Odd Numbers bonus"
# puts "------------------------"
# num=1
# loop do
#   puts num if num.odd?
#   num += 1
#   break if (num >= 100)
# end
#
# puts
# puts "------------------------"

# #Even Numbers
# puts "Even Numbers"
# puts "------------------------"
# num=1
# loop do
#   puts num if num.even?
#   num += 1
#   break if (num >= 100)
# end
#
# puts
# puts "------------------------"

#
# #Sum or product of consecutive integers
# puts "Sum or product of consecutive integers"
# puts "------------------------"
#
# puts "Please enter an number greater than 0."
# input=gets.chomp
#
# loop do
#    if (input.to_i <= 0)
#      puts "Please enter a number greater than 0"
#      input=gets.chomp
#    end
#   break if input.to_i > 0
# end
#
# puts "Enter s to compute the sum and p to compute the product."
# computation=gets.chomp
# loop do
#    if !["s","p"].include?(computation)
#      puts "Please enter either s or p"
#      computation=gets.chomp
#    end
#   break if ["s","p"].include?(computation)
# end
#
# if computation == "s"
#   sum=0
#   1.upto(input.to_i) do |e|
#     sum+=e
#   end
#   puts "The sum of integers bettween 1 and #{input} is #{sum}"
# else
#   prod=1
#   1.upto(input.to_i) do |e|
#     prod = e * prod
#   end
#   puts "The product of integers bettween 1 and #{input} is #{prod} "
# end
#
# puts
# puts "------------------------"

#String assignment
puts "String assignment"
puts "------------------------"

str = "test"
str2 = str
str = "no test"
puts str, str2



puts
puts "------------------------"
