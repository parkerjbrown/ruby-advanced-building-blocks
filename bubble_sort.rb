# PROJECT 01: Bubble Sort

def bubble_sort(array)
  (array.length - 2).times do
    i = 0
    while i < (array.length - 1)
      if (array[i] <=> array[i + 1]) == 1
        array[i], array[i + 1] = array[i + 1], array[i]
      end
      i += 1
    end
  end

  puts "Sorted Array: #{array}"
end

def bubble_sort_by(array)
  (array.length - 2).times do
    i = 0
    while i < (array.length - 1)
      if yield(array[i], array[i + 1]) > 0
        array[i], array[i + 1] = array[i + 1], array[i]
      end
      i += 1
    end
  end

    puts "Sorted Array: #{array}"
end

bubble_sort([4,3,78,2,0,2])
bubble_sort([724, 82, 8009, 12, 0, 13, 623])
bubble_sort_by(["hi", "hello", "hey"]) { |left,right| left.length - right.length }
