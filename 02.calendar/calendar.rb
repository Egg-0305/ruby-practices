#!/usr/bin/env ruby
require 'date'
require 'optparse'

target_month = Date.today.month
target_year = Date.today.year

opt = OptionParser.new

opt.on("-m MONTH", Integer) { |m| target_month = m }
opt.on("-y YEAR", Integer){ |y| target_year = y }
opt.parse!(ARGV) 

def title(month:,year:)
  "#{month}月 #{year}"
end

puts title(month: target_month, year: target_year).center(21)
puts "日 月 火 水 木 金 土".rjust(14)

last_date = Date.new(target_year, target_month, -1)
first_date = Date.new(target_year, target_month, 1)

print " " * 3 * first_date.wday

Range.new(first_date, last_date).each do |date|
  if date.wday == 6
    puts date.day.to_s.rjust(3)
  else
    print date.day.to_s.rjust(3)
  end
end

