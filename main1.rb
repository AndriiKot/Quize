def copyArrayDoSmth(arr,instructions)
   output = []
   arr.size.times { |i| output.push(instructions[arr[i]])}
   output
end

class Instructions
  def add(arg) = arg + arg
  def squar(arg) = arg * arg
end

instructions = Instructions.new

add = instructions.method(:add)
squar = instructions.method(:squar)


arr = *1..10

newArr1 = copyArrayDoSmth(arr,add)
newArr2 = copyArrayDoSmth(arr,squar)

p arr
p newArr1
p newArr2













