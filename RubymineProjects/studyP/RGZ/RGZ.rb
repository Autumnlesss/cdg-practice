numbers = Array[1,2,3,4,5,6,7,8,9,10]

def even_first_odd_second (ary)
  if ary.length % 2 == 0
  odd = Array.new(ary.length/2)
  else
    odd = Array.new((ary.length/2)-1)
  end
  for i in 0..ary.length do
    if i % 2 == 0
      puts ary[i]
      puts ""
    else
      odd[i-1] = ary[i]
    end
  end
  puts odd
  puts ""
end

def odd_first_even_second (arr)
  even = Array.new(arr.length/2)
  for i in 0..arr.length do
    if i % 2 == 0
      puts arr[i]
      puts ""
    else
      even[i-1] = arr[i]
    end
  end
  puts even
  puts ""
end

even_first_odd_second(numbers)
odd_first_even_second(numbers)

