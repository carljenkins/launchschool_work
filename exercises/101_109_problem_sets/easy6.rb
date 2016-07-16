#Delete Vowels
puts "Delete Vowels"
puts "------------------------"


def remove_vowels(vowels)
    remoed_vowels = vowels.collect do |str|
      str.gsub(/[aeiou]/i, '')
    end
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #== %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) #== %w(grn YLLW blck wht)
 p remove_vowels(%w(ABC AEIOU XYZ)) #== ['BC', '', 'XYZ']


puts
puts "------------------------"