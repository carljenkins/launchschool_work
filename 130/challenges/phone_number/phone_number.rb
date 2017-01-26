#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
class PhoneNumber
  attr_reader :number

  BAD_NUMBER = '0000000000'.freeze

  def initialize(number)
    @number = validate(sanitize(number))
  end

  def area_code
    number[0,3]
  end

  def to_s
    "(#{number[0,3]}) #{number[3,3]}-#{number[6,4]}"
  end

  private

  def validate(number)
    return BAD_NUMBER if !is_valid?(number)
    return number if number.size == 10
    digits_11 =
      if(valid_dialing_code?(number))
        number[1, 10]
      else
        BAD_NUMBER
      end
    digits_11
  end

  def sanitize(number)
    number.gsub(/[()-.\s]/, '')
  end

  def is_valid?(number)
    (number.size == 10 || valid_dialing_code?(number)) && !(number =~ /[A-Za-z]/)
  end

  def valid_dialing_code?(number)
    number.size == 11 &&
      number[0].to_i == 1
  end
end
