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

# 3x3 MAS or SAM
x_count = 0

(0..char_matrix.size - 3).each do |i|
  (0..char_matrix[0].size - 3).each do |j|
    window = char_matrix[i, 3].map { |row| row[j, 3] }
    d1 = (0..2).map { |k| window[k][k] }.join
    d2 = (0..2).map { |k| window[k][2 - k] }.join
    if ["SAM", "MAS"].include?(d1) && ["SAM", "MAS"].include?(d2)
      x_count += 1
    end
  end
end

puts "Total X-MAS found: #{x_count}"