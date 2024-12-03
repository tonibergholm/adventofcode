file_path = '3.txt'
file_content = File.read(file_path)

segment_results = []
count = 0 
file_content.scan(/mul\((\d+),(\d+)\)/) do |a, b|
  segment_results << a.to_i * b.to_i
  count += 1
end
puts "Total sum of #{count} multiplications: #{segment_results.sum}"


enabled = true
segment_results = []
count = 0

file_content.scan(/(do\(\)|don't\(\)|mul\((\d+),(\d+)\))/) do |match|
  if match[0] == "don't()"
    enabled = false
  elsif match[0] == 'do()'
    enabled = true
  elsif enabled && match[1] && match[2]
    segment_results << match[1].to_i * match[2].to_i
    count += 1
  end
end

puts "Total sum of #{count} multiplications: #{segment_results.sum}"