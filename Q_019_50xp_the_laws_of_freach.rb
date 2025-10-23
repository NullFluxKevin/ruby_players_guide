
def my_min(arr)
  minimum = nil
  arr.each do |i|
    minimum = i if (minimum.nil?) || (i < minimum)
  end

  minimum
end

def avg(arr)
  total = 0.0
  arr.each do |i|
    total += i
  end
  total / arr.size
end


if __FILE__ == $0
  arr = [4, 51, -7, 13, -99, 15, -8, 45, 90]
  puts my_min(arr)
  puts avg(arr)
end
