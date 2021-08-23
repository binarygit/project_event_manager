#!/usr/bin/ruby
require 'csv'
require 'time'
require 'pry-byebug'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

week_days = Array.new(7) {|i| i * 0}

contents.each do |row|
  reg = row[:regdate]
  time = Time.strptime(reg, '%m/%d/%y %H:%M')
  day = time.wday
  week_days[day] += 1
end

puts "Sunday is the start of the week, which is denoted by 0. The peak day is #{week_days.max}" 
