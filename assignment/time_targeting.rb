#!/usr/bin/ruby
require 'csv'
require 'time'
require 'pry-byebug'

contents = CSV.open(
  'event_attendees_full.csv',
  headers: true,
  header_converters: :symbol
)

hours = Array.new(24) {|i| i * 0}

contents.each do |row|
  reg = row[:regdate]
  time = Time.strptime(reg, '%m/%d/%y %H:%M')
  hour = time.hour
  hours[hour] += 1
end

peak_hour = hours.index(hours.max)

puts "The hour with the highest number of reg is #{peak_hour}"
puts hours.size
puts hours[peak_hour]
p hours
