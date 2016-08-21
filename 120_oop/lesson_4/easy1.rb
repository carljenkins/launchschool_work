# Question 1
# Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?
#
# true
# "hello"
# [1, 2, 3, "happy days"]
# 142

# Answer
# They are all objects. In Ruby everything is an object.




#
# Question 2
#
# If we have a Car class and a Truck class and we want to be able to go_fast,
# how can we add the ability for them to go_fast using the module Speed?
# How can you check if your Car or Truck can now go fast?
#
# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end
#
# class Car
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end
#
# class Truck
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end


# Answer

# We can include the Speed module in the Car and Truck class

#
# Question 3
#
# In the last question we had a module called
# Speed which contained a go_fast method. We included this module in the Car
# class as shown below.

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end
#
# class Car
#   include Speed
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end
# When we called the go_fast method from an instance of the Car class
# (as shown below)
# you might have noticed that the string printed when we go fast includes the
# name of the type of vehicle we are using. How is this done?
#
# >> small_car = Car.new
# >> small_car.go_fast
# I am a Car and going super fast!

# Answer
#
# If we create an object of type Car and call the module method.
# Ruby knows that self is currently a Car class and not somemthing else.


# Question 4
#
# If we have a class AngryCat how do we create a new instance of this class?
#
# The AngryCat class might look something like this:
#
# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end
#
#

# Answer
# cat = AngryCat.new



# Question 5
#
# Which of these two classes has an instance variable and how do you know?
#
# class Fruit
#   def initialize(name)
#     name = name
#   end
# end
#
# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end

#
# Answer
#
# The Pizza class has an instance variable. We know this becuase of the @
# symbol in front of the word (@name). The variable in Fruit
# is a local variable.


# Question 6
#
# What could we add to the class below to access the instance variable @volume?
#
# class Cube
#   def initialize(volume)
#     @volume = volume
#   end
# end

#
# Answer:
#
# We could add an attr_accessor or attr_reader. Or, we could even add our own
# custom method and expose the attribute that way.

# Question 7
#
# What is the default thing that Ruby will print to the screen if you
# call to_s on an object? Where could you go to find out if you want to be sure?
#
# Ruby will print the objects class and an encoding of the object id.
# We can find this information by looking up the documenation for Object


#
# Question 8
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
# You can see in the make_one_year_older method we have used self.
# What does self refer to here?

# Answer:
#
# self refers to the calling object instance.


#
# Question 9
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
# In the name of the cats_count method we have used self.
# What does self refer to in this context?

#
# Answer:
# In this case the word self on the method refers to the class - Cat.
#



#
# Question 10
#
# If we have the class below, what would you need to call to create
#a new instance of this class.
#
# class Bag
#   def initialize(color, material)
#     @color = color
#     @material = material
#   end
# end

# Answer
# paper = Bag.new('red', 'paper')
