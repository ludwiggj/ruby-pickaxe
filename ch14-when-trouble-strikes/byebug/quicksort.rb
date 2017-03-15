def quicksort(array)
  return array if array.length <= 1

  pivot_index = (array.length / 2).to_i
  pivot_value = array[pivot_index]
  array.delete_at(pivot_index)

  lesser = Array.new
  greater = Array.new

  array.each do |x|
    if x <= pivot_value
      lesser << x
    else
      greater << x
    end
  end
  byebug
  # byebug if pivot_value == 28

  return quicksort(lesser) + [pivot_value] + quicksort(greater)
end

unsorted = [77, 22, 66, 28, 39, 4, 54]

puts "Unsorted: #{unsorted}"

puts "Sorted: #{quicksort(unsorted)}"
