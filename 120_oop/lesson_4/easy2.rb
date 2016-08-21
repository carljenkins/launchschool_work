# Question 1
#
# You are given the following code:
#
# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end
#
#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end
# What is the result of calling
#
# oracle = Oracle.new
# oracle.predict_the_future
#
# Answer:
#
# The method will get a value form the choices method and
# a message that says " You will <do something>" be displayed



# Question 2
#
# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.
#
# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end
#
#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end
#
# class RoadTrip < Oracle
#   def choices
#     ["visit Vegas", "fly to Fiji", "romp in Rome"]
#   end
# end
# What is the result of the following:
#
# trip = RoadTrip.new
# trip.predict_the_future


# Answer:
#
# The method will print a message containing one of the strings from
# the choices array in the RoadTrip class. "You will <visit>"
#
# Even though the Oracle class has a chocies method. Ruby still calls the chocies
# from RoadTrip because that is the type of object that was created.

# Question 3
#
# How do you find where Ruby will look for a method when that method is called?
#   How can you find an object's ancestors?
#
# module Taste
#   def flavor(flavor)
#     puts "#{flavor}"
#   end
# end
#
# class Orange
#   include Taste
# end
#
# class HotSauce
#   include Taste
# end
# What is the lookup chain for Orange and HotSauce?


# Answer:

# You can use the ancestors method on the class to determine the look up path.
# Orange.ancestors
# and/or
# HotSauce.ancestors



# Question 4
#
# What could you add to this class to simplify it and remove two methods from
# the class definition while still maintaining the same functionality?
#
# class BeesWax
#   def initialize(type)
#     @type = type
#   end
#
#   def type
#     @type
#   end
#
#   def type=(t)
#     @type = t
#   end
#
#   def describe_type
#     puts "I am a #{@type} of Bees Wax"
#   end
# end

# Answer:
#
# We could use an attr_accessor for the @type instance variable.

#
# Question 5
#
# There are a number of variables listed below.
# What are the different types and how do you know which is which?
#
# excited_dog = "excited dog"
# @excited_dog = "excited dog"
# @@excited_dog = "excited dog"

# Answer:
# The first is a local variable
# 2nd is an instance variable
# 3rd is a class variable

# Question 6
#
# If I have the following class:
#
# class Television
#   def self.manufacturer
#     # method logic
#   end
#
#   def model
#     # method logic
#   end
# end
# Which one of these is a class method (if any) and how do you know?
# How would you call a class method?
# The method self.manufacturer is a class method beucase it starts with a
# self. We can call this method by using the class name followed by the
# method name such as Television.manufacturer


# Question 7
#
# If we have a class such as the one below:
#
# class Cat
#   @@cats_count = 0
#
#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end
#
#   def self.cats_count
#     @@cats_count
#   end
# end
# Explain what the @@cats_count variable does and how it works.
# What code would you need to write to test your theory?
# The @@cats_count variable is a class variable. It is
# initialized to add to the variable whenver we create an
# object of type Cat. In order to test this we coudl create a
# coupule objects of this type then call the Cat.cats_count method.

# tabby = Cat.new('tabby')
# calico = Cat.new('calico')
#
# puts Cat.cats_count


#
# Question 8
#
# If we have this class:
#
# class Game
#   def play
#     "Start the game!"
#   end
# end
# And another class:
#
# class Bingo
#   def rules_of_play
#     #rules of play
#   end
# end
# What can we add to the Bingo class to allow it
# to inherit the play method from the Game class?

# Answer:
#
# We can use the Game class as the super class of Bingo.
# Bing < Game - this way the Bingo class can now use the play method.


# Question 9
#
# If we have this class:
#
# class Game
#   def play
#     "Start the game!"
#   end
# end
#
# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end
# What would happen if we added a play method to the Bingo class,
# keeping in mind that there is already a method of this name in the Game
# class that the Bingo class inherits from.

# Answer:
#
# If we added a play method to Bingo it would override the play method
# in the Game class. Then whenver we create a Bingo objectc the Bingo
# version would be called.

# Question 10
#
# What are the benefits of using Object Oriented Programming in Ruby?
# Think of as many as you can.

# Because there are so many benefits to using OOP we will just summarize
# some of the major ones:
#
# Creating objects allow programmers to think more abstractly about the code
# they are writing.

# Objects are represented by nouns so are easier to conceptualize.

# It allows us to only expose functionality to the parts of code that need it,
# meaning namespace issues are much harder to come across.

# It allows us to easily give functionality to different parts of an application
# without duplication.

# We can build applications faster as we can reuse pre-written code.

# As the software becomes more complex this complexity can be more easily managed.
