#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []

scores.each do |s|
  if s == 'X' && shots.size < 18
    shots << 10
    shots << 0
  elsif s == 'X'
    shots << 10
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  if frames.size == 10
    frames[9] << s[0]
  else
    frames << s
  end
end

point = 0
frames.each_with_index do |frame, i|
  point += if frame[0] == 10 && i <= 8
             if frames[i + 1][0] == 10 && i <= 7
               10 + frames[i + 1][0] + frames[i + 2][0]
             else
               10 + frames[i + 1][0] + frames[i + 1][1]
             end
           elsif frame.sum == 10 && i <= 8
             10 + frames[i + 1][0]
           else
             frame.sum
           end
end

puts point
