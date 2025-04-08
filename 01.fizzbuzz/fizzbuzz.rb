#!/usr/bin/env ruby

(1..20).each do |x|
  case
  when x % 3 == 0 && x % 5 == 0
    puts "FizzBuzz"
  when x % 3 == 0
    puts "Fizz"
  when x % 5 == 0
    puts "Buzz"
  when x % 3 != 0
    puts x
  end
end

