class Robot
  attr_accessor :name

  @used_names = []

  def initialize
    @name = set_name
    Robot.used_names << @name
  end

  def self.used_names
    @used_names
  end

  def used_names
    self.class.used_names
  end

   def reset
     set_name
   end

   private

   def set_name
     name = ""
     loop do
       name = generate_name
       break unless Robot.used_names.include?(name)
     end
     self.name = name
   end

   def generate_name
     result = ""
     2.times do
       result << rand((65..90)).chr
     end
     3.times do
       result << rand((48..57)).chr.to_s
     end
     result
   end
end
