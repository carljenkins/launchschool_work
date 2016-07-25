

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


#
# #Letter Counter (Part 1)
# puts "Letter Counter (Part 1)"
# puts "------------------------"
#
#
# def word_sizes(words)
#   words_cnt= Hash.new(0)
#   words.split.each do |wrd|
#     words_cnt[wrd.size] += 1
#   end
#   words_cnt.sort.to_h
# end
#
# p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') #== { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") #== { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') #== {}
#
#
# puts
# puts "------------------------"




# #Letter Counter (Part 2)
# puts "Letter Counter (Part 2)"
# puts "------------------------"
#
#
# def remove_non_words(param)
#   param.gsub(/[^[:alpha:]]+/, '')
# end
#
# def word_sizes(words)
#   words_cnt= Hash.new(0)
#   words.split.each do |wrd|
#     words_cnt[remove_non_words(wrd).size] += 1
#   end
#   words_cnt.sort.to_h
# end
#
# p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') #== { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") #== { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') #== {}
#
#
# puts
# puts "------------------------"



# #Alphabetical Numbers
# puts "Alphabetical Numbers"
# puts "------------------------"
#
# ENGLISH_WORDS = {"zero" => 0, "one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6,
#                 "seven" => 7, "eight" => 8, "nine" => 9, "ten" => 10, "eleven" => 11, "tweleve" => 12, "thirteen" => 13,
#                 "fourteen" => 14, "fifteen" => 15, "sixteen" => 16, "seventeen" => 17, "eighteen" => 18, "nineteen" => 19}
#
# def alphabetic_number_sort(nums)
#    found = {}
#    nums.each do |n| #search through the array passed in don't want to assume it would always be 0..19
#       if ENGLISH_WORDS.value?(n) #Do we have the value?
#         k,v = ENGLISH_WORDS.rassoc(n) # if yes then extract the k,v pair
#         found[k] = v   #assing the key value to the found hash
#       end
#    end
#   found.sort_by { |word, num| word}.to_h.values #sory the found items by the word (key) then convert to hash and return the values
# end
#
#
# p alphabetic_number_sort((0..19).to_a)
#
# # puts
# # puts "------------------------"




# #ddaaiillyy ddoouubbllee
# puts "ddaaiillyy ddoouubbllee"
# puts "------------------------"
#
# def crunch(words)
#   words.squeeze
# end
#
# p crunch('ddaaiillyy ddoouubbllee')# == 'daily double'
# p crunch('4444abcabccba') #== '4abcabcba'
# p crunch('ggggggggggggggg') #== 'g'
# p crunch('a') #== 'a'
# p crunch('') #== ''
#
# # puts
# # puts "------------------------"


# #Bannerizer
# # puts "Bannerizer"
# # puts "------------------------"
#
#
# def print_in_box(str)
#   width = (str.size * 2) / 4
#   top = '+' << '-' * str.size * 2 << '+'
#   bottom = '+' << '-' * str.size * 2 << '+'
#
#   puts top
#   puts '|' << ' ' * width << str << ' ' * width << '|'
#   puts bottom
# end
#
#
# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')
# print_in_box('I am testing')
# # puts
# # puts "------------------------"



