#Question 1
# We can use the has_key? method to see if there is an age for Spot
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.has_key?("Spot")

#two other method we could use are 'assoc' or the include? method
puts ages.assoc("Spot")
puts ages.include?("Spot")


#Question 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
      "Marilyn" => 22, "Spot" => 237 }

total = ages.values.reduce(:+)
puts total


#Question 3
#use select method to to ensure we only get ages less than 100
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.select{|key,value|  value < 100}

#Question 4
munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.capitalize
puts munsters_description.swapcase
puts munsters_description.downcase
puts munsters_description.upcase

#Question 5
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
p ages.merge!(additional_ages)


#Question 6
# conver values to an array then use the min method of the Enumerable class
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
  "Marilyn" => 22, "Spot" => 237 }

puts ages.values.min



#Question 7
advice = "Few things in life are as important as house
      training your pet dinosaur."
puts advice =~ /dino/

#Question 8
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.any?{|obj| obj.start_with?("Be")}

#Question 9
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
new_flintstones = flintstones.map! do |ele|
  ele.slice!(0,3)
end
p new_flintstones

#Question 10
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map!{|e| e.slice(0,3)  }
p flintstones
