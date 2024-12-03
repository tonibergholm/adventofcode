#!/usr/bin/env ruby
# Advent of Code 2024 Day 1
file_path = '1.txt'
file_contents = File.read(file_path)

  data = file_contents
  lines = data.split("\n")  
  array1 = []
  array2 = []

  lines.each do |line|
    col1, col2 = line.split
    array1 << col1.to_i
    array2 << col2.to_i
  end

  array1.sort!
  array2.sort!

  total_distance = 0

  array1.each_with_index do |value, index|
    total_distance += (value - array2[index]).abs
  end

  puts "Total distance: #{total_distance}"
