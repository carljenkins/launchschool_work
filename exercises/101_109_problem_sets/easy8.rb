# #Sum of Sums
# puts "Sum of Sums"
# puts "------------------------"
#
# def sum_of_sums(arr)
#
#   #first way to get the result
#  # sum = 0
#  #  arr.each_with_index do |n, i|
#  #    arr.slice((0..i)).map{|e| sum += e  }
#  #  end
#  #  sum
#
#
#   #another way to do it.
#
#   sum = 0
#   arr.each_index do |i|
#     sum += arr[0..i].reduce(:+)
#   end
#
#   sum
#
# end
# p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) #== 4
# p sum_of_sums([1, 2, 3, 4, 5]) #== 35
#
# puts "------------------------"





#
#
# #Madlibs
# puts "Madlibs"
# puts "------------------------"
#
# puts "Enter a noun:"
# noun = gets.chomp
#
# puts "Enter a verb:"
# verb = gets.chomp
#
# puts "Enter an adjective:"
# adj = gets.chomp
#
# puts "Enter an adverb: "
# adverb = gets.chomp
#
# puts "------------------------"


# def repeater(str)
#   result = str.each_char.map do |c|
#     c * 2 if
#   end
#  result.join
#
# end
#
#
#  p repeater('Hello')
#  p repeater("Good job!") #== "GGoooodd  jjoobb!!"
# p repeater('') #== ''


# def is_digit_punct_or_space?(letter)
#   letter.match(/[[:digit:]]/) ||
#   letter.match(/[[:blank:]]/) ||
#   letter.match(/[[:punct:]]/)
# end
#
# def double_consonants(str)
#   result = str.each_char.map do |c|
#    if is_digit_punct_or_space?(c)
#      c
#    else
#      c * 2
#    end
#   end
#   result.join
# end
#
#
# p double_consonants('String')# == "SSttrrinngg"
# p double_consonants("Hello-World!") #== "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") #== "JJullyy 4tthh"
# p double_consonants('') #== ""


def fizzbuzz(a1, a2)
  result = []
  a1.upto(a2) do |n|
    if (n % 3 == 0) && (n % 5 == 0)
      result << "FizzBuzz"
    elsif n % 3 == 0
      result << "Fizz"
    elsif n % 5 == 0
      result << "Buzz"
    else
      result << n
    end
  end
   result.join(", ")
 end

p fizzbuzz( 1, 20)



# Iloveruby

# def center_of(str)
#   if (str.size % 2 == 0)
#     str[(str.size / 2) - 1, 2]
#   else
#     str[str.size / 2]
#   end
# end
#
#
#
# p center_of('I love ruby') #== 'e'
# p center_of('Launch School') #== ' '
# p center_of('Launch') #== 'un'
# p center_of("Launchschool")
# p center_of('x')
#


# def process_file(str)
#  lines =  str.split(/\.|\?|!/)
#
#  longest = lines.max_by {|l| l.split.size}
#
#  # long_sent = longest.strip
#  # num_words = long_sent.split.size
#
#
# end
#
#
# process_file(File.read("my_text.txt"))
