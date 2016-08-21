# Question 1
#
# If we have this code:
#
# class Greeting
#   def greet(message)
#     puts message
#   end
# end
#
# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end
#
# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end
# What happens in each of the following cases:
#
# case 1:
#
# hello = Hello.new
# hello.hi
# The word "Hello" will be printed to the screen.

# case 2:
#
# hello = Hello.new
# hello.bye
#We will receive a NoMethodError since the bye method
# exists in the GoodBye class and not in Greeting or Hello.


# case 3:

# hello = Hello.new
# hello.greet

# We would get a error indicating we are passing the wrong number of arguments.
# the greet method is expecting 1 argument and we are not providing any.

# case 4:
# hello = Hello.new
# hello.greet("Goodbye")
# GoodBye will be printed to the screen.

# case 5:
# Hello.hi

# We would get a NoMethodError since we don't have hi class method.


#
# Question 2
#
# In the last question we had the following classes:
#
# class Greeting
#   def greet(message)
#     puts message
#   end
# end
#
# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end
#
# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end
# If we call Hello.hi we get an error message. How would you fix this?

# Answer:
#
# We can fix this by adding a self.hi class method definition.
# But, since the greet method on the Greeting class is an instance method.
# We need to instatiate a Greeting object and call the greet method.

# Question 3
#
# When objects are created they are a separate realization of a
# particular class.

# Given the class below, how do we create two different instances of
# this class, both with separate names and ages?
#
# class AngryCat
#   def initialize(age, name)
#     @age  = age
#     @name = name
#   end
#
#   def age
#     puts @age
#   end
#
#   def name
#     puts @name
#   end
#
#   def hiss
#     puts "Hisssss!!!"
#   end
# end
# cat1 = AngryCat(3, "Pride")
# cat2 = AngryCat(5, "Kastanza")



# Question 4
#
# Given the class below, if we created a new instance of the class and then
# called to_s on that instance we would get
# something like "#<Cat:0x007ff39b356d30>"
#
# class Cat
#   def initialize(type)
#     @type = type
#   end
# end
# How could we go about changing the to_s output on this method to look
# like this: I am a tabby cat? (this is assuming that "tabby" is the type
# we passed in during initialization).
# Answer:
#
# Provide a to_s method definition like this:
#
# def to_s
#  "I am a #{type} cat"
# end


#
# Question 5
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
# What would happen if I called the methods like shown below?
#
# tv = Television.new
# tv.manufacturer
# tv.model
#
# Television.manufacturer
# Television.model

#
# tv.manufacturer call would throw an error as manufacturer is a
# class method and not an instance method.
# The tv.model call would be successful.
#
# The call to Television.model would also throw an error as that method
# is an instance method and must be called by an instance of the class.



# Question 6
#
# If we have a class such as the one below:
#
# class Cat
#   attr_accessor :type, :age
#
#   def initialize(type)
#     @type = type
#     @age  = 0
#   end
#
#   def make_one_year_older
#     self.age += 1
#   end
# end
# In the make_one_year_older method we have used self.
# What is another way we could write this method so we
# don't have to use the self prefix?
#
# Answer:
# We could assing the value to the actauly instance variable @age.





# Question 7
#
# What is used in this class but doesn't add any value?
#
# class Light
#   attr_accessor :brightness, :color
#
#   def initialize(brightness, color)
#     @brightness = brightness
#     @color = color
#   end
#
#   def self.information
#     return "I want to turn on the light with a brightness
#     level of super high and a color of green"
#   end
#
# end
#
# Answer:
#
# The return statement. The last expression of a Ruby method will be
# automatically the return value.
