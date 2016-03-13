# Question 1
# This exercise prints out 1,2,2,3.
# it does this becuase numbers.uniq does not modify the caller

numbers = [1,2,2,3]
numbers.uniq
puts numbers


# Question 2
# In Ruby ! can be used for negation for example !true.
#Or, it  can be used after a method name
# which signifies that the method alters your object in some way.
# The ? at the end of a method means the method returns a truth value.
#True or False.
# Scenarios:
# != means not equal to and it is usually used in a conditional
# adding ! before variable chagnes the truthiness of the variable to false.
user_name = 'carl'
puts !user_name

# Adding ! after a method name such as words.uniq! causes
#the method to be modfied.
words = ["test", "test", "pass"]
puts words.uniq!

# putting ? before a variable throws an error "unexpected '?'"

# appending a ? after a variable throws an 'undefiend method' exception.
# Ruby expects this to be a method call.

# prefixing !! before user_name negates the negation... Changes to truthiness
# back to the original
puts !!user_name


# Question 3
advice =
"Few things in life are as important as house training your pet dinosaur."
puts advice.sub!(/important/, 'urgent')

#Question 4
# delete_at(1) will deltete the value located at index 1
# in this case that value is 2
numbers = [1,2,3,4,5]
puts numbers.delete_at(1)
numbers = [1,2,3,4,5]
# delete(1) will delete the value of 1 from the array.
# this leaves 2,3,4,5 left
numbers.delete(1)


#Question 5
#To find if 42 lies between 10 and 100 we can use the include? method
# of the Range class
puts (10..100).include?(42)

#Question 6
# Below are two different ways to insert "Four score and beofre the
#value held in famous_words"
famous_words = "seven years ago..."

puts famous_words.insert(0, "Four score and ")
puts "Four score and " + famous_words



#Question 7
#The reslut of eval(how_deep) is 42
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

puts eval(how_deep)


#Question 8
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
p flintstones.flatten

#Question 9
# the assoc method of Hash object searchs through the hash for a key
# which matches the passed in parameter. When it find one assoc will return
# the key and value.
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2,
  "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.assoc("Barney")


#Question 10

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
bedrock = {}
flintstones.each_with_index {|v,i|  bedrock[v] = i }
p bedrock
