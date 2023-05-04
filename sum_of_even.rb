array1 = [1, 2, 3, 4, 5, 6]
output1 = 12
array2 = [-4, 4, 3, 9, 7]
output2 = 0

def sum_evens(array)
  # array.select { |n| n % 2 == 0}.reduce(:+) 
  result = 0

  array.each do |n|
    result += n if n.even?
  end
  result
end

puts sum_evens(array1)

puts sum_evens(array2)
