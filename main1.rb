def copyArrayDoSmth(arr,instructions)
   output = []
   arr.size.times { |i| output.push(instructions[arr[i]])}
   output
end

class Instr
  def add(arg) = arg + arg
  def squar(arg) = arg * arg
end

instructions = Instr.new
instructionsAdd = instructions.method(:add)
instructionsSquar = instructions.method(:squar)


p instructionsAdd
p instructionsSquar

arr = *1..10

newArr1 = copyArrayDoSmth(arr,instructionsAdd)
newArr2 = copyArrayDoSmth(arr,instructionsSquar)

p arr
p newArr1
p newArr2













