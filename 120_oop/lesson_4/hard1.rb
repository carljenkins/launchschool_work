# class SecretFile
#   attr_reader :data
#
#   def initialize(secret_data)
#     @data = secret_data
#   end
# end
# She needs to modify it so that any access to data must result in a log entry being generated.
# That is, any call to the class which will result in data being
# returned must first call a logging class.
# The logging class has been supplied to Alyssa and looks like the following:
#
# class SecurityLogger
#   def create_log_entry
#     # ... implementation omitted ...
#   end
# end
# Hint: Assume that you can modify the initialize method in
# SecretFile to have an instance of SecurityLogger be passed in as an additional
# argument. It may be helpful to review the lecture on collaborator objects
# for this exercise.
