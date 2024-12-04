file_path = '4.txt'
input = File.read(file_path).split("\n")

xmas_count = 0
target = "XMAS"

# horizontal ones
input.each do |line|
  xmas_count += line.scan(target).count
  xmas_count += line.reverse.scan(target).count
end

# vertical ones
char_matrix = input.map { |line| line.chars }

char_matrix.transpose.each do |column|
  column_str = column.join
  xmas_count += column_str.scan(target).count
  xmas_count += column_str.reverse.scan(target).count
end

# annoying diagonals
(0..char_matrix.size - 1).each do |i|
  diagonal1 = []
  diagonal2 = []
  (0..[char_matrix.size - i, char_matrix[0].size].min - 1).each do |j|
    diagonal1 << char_matrix[i + j][j]
    diagonal2 << char_matrix[j][i + j] if i > 0
  end
  xmas_count += diagonal1.join.scan(target).count
  xmas_count += diagonal1.join.reverse.scan(target).count
  xmas_count += diagonal2.join.scan(target).count if i > 0
  xmas_count += diagonal2.join.reverse.scan(target).count if i > 0
end

# other diagonal
(0..char_matrix.size - 1).each do |i|
  diagonal1 = []
  diagonal2 = []
  (0..[char_matrix.size - i, char_matrix[0].size].min - 1).each do |j|
    diagonal1 << char_matrix[i + j][char_matrix[0].size - 1 - j]
    diagonal2 << char_matrix[j][char_matrix[0].size - 1 - (i + j)] if i > 0
  end
  xmas_count += diagonal1.join.scan(target).count
  xmas_count += diagonal1.join.reverse.scan(target).count
  xmas_count += diagonal2.join.scan(target).count if i > 0
  xmas_count += diagonal2.join.reverse.scan(target).count if i > 0
end

puts "Total 'XMAS' found: #{xmas_count}"
