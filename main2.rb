def copyArrayDoSmth(arr,instructions)
   output = []
   arr.size.times { |i| output.push(instructions[arr[i]])}
   output
end


def add(arg) = arg + arg
def squar(arg) = arg * arg



add = method(:add)
squar = method(:squar)


arr = *1..5

newArr1 = copyArrayDoSmth(arr,add)
newArr2 = copyArrayDoSmth(arr,squar)

p arr
p newArr1
p newArr2













