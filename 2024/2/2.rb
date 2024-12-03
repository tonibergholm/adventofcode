def valid_line?(line)
  numbers = line.split.map(&:to_i)
  increasing = numbers.each_cons(2).all? { |a, b| b > a }
  decreasing = numbers.each_cons(2).all? { |a, b| b < a }
  valid_difference = numbers.each_cons(2).all? { |a, b| (b - a).abs.between?(1, 3) }

  (increasing || decreasing) && valid_difference
end

def almost_valid_line?(line)
  numbers = line.split.map(&:to_i)

  numbers.each_with_index do |_, index|
    modified_numbers = numbers.dup
    modified_numbers.delete_at(index)
    return true if valid_line?(modified_numbers.join(' '))
  end

  false
end

def count_valid_lines(file_path)
  valid_lines_count = 0
  almost_valid_lines_count = 0

  File.foreach(file_path) do |line|
    valid_lines_count += 1 if valid_line?(line)
    almost_valid_lines_count += 1 if almost_valid_line?(line)
  end

  [valid_lines_count, almost_valid_lines_count]
end

file_path = '2.txt'
puts count_valid_lines(file_path)