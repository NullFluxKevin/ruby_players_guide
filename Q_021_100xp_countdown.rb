
def recur_countdown(count)
  puts count
  recur_countdown(count - 1) if count != 1
end

if __FILE__ == $0
  recur_countdown(10)
end
