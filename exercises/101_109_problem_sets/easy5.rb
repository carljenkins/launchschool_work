

# #Ascii String value
# puts "Ascii String value"
# puts "------------------------"

# def ascii_value(param)
#   total = 0
#   param.chars.each {|c| total += c.ord   }
#   total
# end

# p ascii_value('Four score')# == 984
# p ascii_value('Launch School') #== 1251
# p ascii_value('a') #== 97
# p ascii_value('')#== 0

# puts
# puts "------------------------"



# #After midnight part 1
# puts "After midnight part 1"
# puts "------------------------"

# def time_of_day(minutes)

# end

# time_of_day(0) #== "00:00"
# time_of_day(-3) #== "23:57"
# time_of_day(35) #== "00:35"
# time_of_day(-1437)# == "00:03"
# time_of_day(3000) #== "02:00"
# time_of_day(800) #== "13:20"
# time_of_day(-4231) #== "01:29"

# puts
# puts "------------------------"






# #Letter Swap
# puts "Letter Swap"
# puts "------------------------"


# def swap(str)
#   ret_wrds = 
#     str.split(' ').map do |wrd|
#       hold = wrd[-1]
#       wrd[-1] = wrd[0]
#       wrd[0] = hold
#       wrd
#   end
#   ret_wrds.join(' ')
# end

# p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') #== 'ebcdA'
# p swap('a') #== 'a'

# puts
# puts "------------------------"





# #Clean up the words
# puts "Clean up the words"
# puts "------------------------"

# def cleanup(str)
#   str.gsub(/[^a-zA-Z0-9_]+/, ' ') 
# end

# p cleanup("---what's my +*& line?") #== ' what s my line '

# puts
# puts "------------------------"



#Letter Counter (Part 1)
puts "Letter Counter (Part 1)"
puts "------------------------"


def word_sizes(words)

end


word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') #== { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") #== { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') #== {}

puts
puts "------------------------"