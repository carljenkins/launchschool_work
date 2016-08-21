# Question 1

# Ben asked Alyssa to code review the following code:
#
# class BankAccount
#   attr_reader :balance
#
#   def initialize(starting_balance)
#     @balance = starting_balance
#   end
#
#   def positive_balance?
#     balance >= 0
#   end
# end
# Alyssa glanced over the code quickly and said -
# "It looks fine, except that you forgot to put the @ before balance when
# you refer to the balance instance variable in the body of the
# positive_balance? method."
#
# "Not so fast", Ben replied. "What I'm doing here is valid -
# I'm not missing an @!"
#
# Who is right, Ben or Alyssa, and why?


# # Answer
# In this case Ben is correct because an attr_reader is defined
# the call to balance in the positive_balance? method is a method call
# and will return the instacne variable value.



# Question 2
#
# Alyssa created the following code to keep track of items
# for a shopping cart application she's writing:
#
# class InvoiceEntry
#   attr_reader :quantity, :product_name
#
#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end
#
#   def update_quantity(updated_count)
#     # prevent negative quantities from being set
#     quantity = updated_count if updated_count >= 0
#   end
# end
# Alan looked at the code and spotted a mistake.
# "This will fail when update_quantity is called", he says.
#
# Can you spot the mistake and how to address it?

# Answer:
#
# The update_quantity method is attempting to set the quantity instance variable
# via a method call to the setter, but a setter has not been defiend it.
# So this code will create a quantity local variable instead.


#
# Question 3
#
# In the last question Alyssa showed Alan this code which keeps track of
# items for a shopping cart application:
#
# class InvoiceEntry
#   attr_reader :quantity, :product_name
#
#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end
#
#   def update_quantity(updated_count)
#     quantity = updated_count if updated_count >= 0
#   end
# end
# Alan noticed that this will fail when update_quantity is called.
# Since quantity is an instance variable, it must be accessed with the
# @quantity notation when setting it. One way to fix this is to change
# attr_reader to attr_accessor and change quantity to self.quantity.
#
# Is there anything wrong with fixing it this way?
#
# Answer:
#
# Currently, there is a guard clause in the update_quantity method
# to ensrue the quantity doesn't get set to a negative value.
# Adding a setter for quantity would curcumvent this guard clause allowing
# negative values.



# Question 4
#
# Let's practice creating an object hierarchy.
#
# Create a class called Greeting with a single method called greet that takes a
# string argument and prints that argument to the terminal.
#
# Now create two other classes that are derived from Greeting: one called Hello
# and one called Goodbye.
#  Hello class should have a hi method that takes no arguments and prints
#  "Hello". The Goodbye class should have a bye method to say
# "Goodbye". Make use of the Greeting class greet method when implementing
# the Hello and Goodbye classes - do not use any puts in the
# Hello or Goodbye classes.


# Answer:
# class Greeting
#   def greet(param)
#     puts param
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


# Question 5

# You are given the following class that has been implemented:
#
# class KrispyKreme
#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end
# end
# And the following specification of expected behavior:
#
# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1
#   => "Plain"
#
# puts donut2
#   => "Vanilla"
#
# puts donut3
#   => "Plain with sugar"
#
# puts donut4
#   => "Plain with chocolate sprinkles"
#
# puts donut5
#   => "Custard with icing"
# Write additional code for KrispyKreme such that the puts
# statements will work as specified above.

# Answer:

# class KrispyKreme
#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end
#
#   def to_s
#     filling = @filling_type ? @filling_type : "Plain"
#     glaze = @glazing ? "with #{@glazing}" : ""
#
#     "#{filling} #{glaze}"
#   end
# end
#
# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")
#
# puts donut1
# puts donut2
# puts donut3
# puts donut4
# puts donut5




#
# Question 6
#
# If we have these two methods:
#
# class Computer
#   attr_accessor :template
#
#   def create_template
#     @template = "template 14231"
#   end
#
#   def show_template
#     template
#   end
# end
# and
#
# class Computer
#   attr_accessor :template
#
#   def create_template
#     self.template = "template 14231"
#   end
#
#   def show_template
#     self.template
#   end
# end
# What is the difference in the way the code works?
#
# The second method calls the setter methods on the object instance.
# While the first sets the @tempalte variable directory. But, the show_template
# calls the getter method.




# Question 7
#
# How could you change the method name below so that the method name
# is more clear and less repetitive.
#
# class Light
#   attr_accessor :brightness, :color
#
#   def initialize(brightness, color)
#     @brightness = brightness
#     @color = color
#   end
#
#   def self.light_information
#     "I want to turn on the light with a brightness level of super high
#     and a colour of green"
#   end
#
# end


# Answer:
#
# When creating a light object it's likely we create one using it's name.
# i.e. light = Light.new. So when calling the method light.light_information it's
# a bit redundant. We could shorten the method name to just informaiton. Thus calling
# light.informaiton is much more semeatic.
