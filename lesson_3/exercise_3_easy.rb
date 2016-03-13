#Question 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# this array could be re-written like this.
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

#Question 2
#we could use the append method of the Array hash
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
p flintstones


#Question 3
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push('Dino', 'Hoppy')
p flintstones

#Question 4
advice = "Few things in life are as important as house training your pet dinosaur."
#Using slice!
puts advice.slice!(39, advice.size)
puts advice

#using slice instead of slice! does not modify the original Starting
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice(39, advice.size)
puts advice


#Question 5
#use the count method of String class
statement = "The Flintstones Rock!"
puts statement.count('t')

#Question 6
#Use the center method of the String class
title = "Flintstone Family Members"
puts title.center(40,' ')
