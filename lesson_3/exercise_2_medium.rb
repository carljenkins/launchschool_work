#Question 1
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

sum = 0
munsters.each do |key,value|
  sum = 0
 sum += value['age'] if value['gender'] == 'male'
end

puts sum



#Question 2

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  puts "#{key} is a #{value['age']} year old #{value['gender']}"
end



#Question 3
#I had to look at the solution for this one.
#my first thought was to write a second method with a !
#Didn't realize Ruby could return 2 values from a method
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param
end




my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"




#Question 4

sentence = "Humpty Dumpty sat on a wall."

reverse_sentence = ""
puts sentence.split(/\W/).reverse.join(' ')


#Question 5
#The printed value will be 34 becuase the code substracts 8 from 42
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8


#Question 6
#The hash is modified becuase the orignal object is not reassinged
# This means the mehtod uses the orignal object passed in and is modified.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
p munsters
puts


#Question 7
#The return value printed is "paper"
# I actaually followed the method calls on this one.
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")


#Question 8
# The printed value will be no.
# This is becuase foo is passed into the bar method.
# The param argument has a value so it's not defaulted to no.
# then param is executed (as foo method call) which returns yes.
# yes is not equal to no so no returns.
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts bar(foo)
