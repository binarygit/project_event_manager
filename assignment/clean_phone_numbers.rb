#!/usr/bin/ruby
require 'csv'
require 'pry-byebug'

def clean_number(number)
  number = number.scan(/\d+/).join

  if number.length == 10
    number
  elsif number.length == 11
    number[0] == '1' ? number[1..10] : "Sorry, bad number"
  else
    "Sorry, bad number"
  end
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  number = clean_number(row[:homephone])

  puts number
end
