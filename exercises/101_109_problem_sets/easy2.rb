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



#When will I retire?
puts "When will I retire"
puts "------------------------"
puts "What is your age?"
age=gets.chomp.to_i

puts "What age would you like to retire?"
retire_age=gets.chomp.to_i

years_to_retirement=retire_age - age
current_year=Time.now.year


puts "It's #{current_year}. You will reture in #{current_year + years_to_retirement}"
puts "You only have #{years_to_retirement} years left!"
puts
puts "------------------------"
