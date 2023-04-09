def copyArrayDoSmth(arr,instructions)
   output = []
   arr.size.times { |i| output.push(instructions[arr[i]])}
   output
end

add = lambda {|arg| arg + arg}
squar = lambda {|arg| arg * arg}


arr = *1..5

newArr1 = copyArrayDoSmth(arr,add)
newArr2 = copyArrayDoSmth(arr,squar)

p arr
p newArr1
p newArr2













