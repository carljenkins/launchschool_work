class OCR

  TEXT_DIGITS =
    {
      0 => "_\n| |\n|_|\n" ,
      1 => "\n  |\n  |\n"  ,
      2 => "_\n_|\n|_\n"   ,
      3 => "_\n_|\n_|\n"   ,
      4 => "\n|_|\n  |\n"  ,
      5 => "_\n|_\n _|\n"  ,
      6 => "_\n|_\n|_|\n"  ,
      7 => "_\n |\n |\n"   ,
      8 => "_\n|_|\n|_|\n" ,
      9 => "_\n|_|\n _|\n"
    }

  def initialize(text)
    @text_value = text
  end

  def convert
    require 'pry'; binding.pry
    TEXT_DIGITS.key(@text_value).to_s
  end



end

text = <<-NUMBER.chomp
    _
  || |
  ||_|

NUMBER
ocr = OCR.new(text)
p text.
