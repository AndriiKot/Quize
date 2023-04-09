# Ruby-CallBack
Callback in Ruby

## Version 1
```ruby
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


arr = *1..5

newArr1 = copyArrayDoSmth(arr,add)
newArr2 = copyArrayDoSmth(arr,squar)

p arr       [ 1, 2, 3, 4, 5 ]
p newArr1   [ 2, 4, 6, 8, 10 ]
p newArr2   [ 1, 4, 9, 16, 25 ]
```

## Version 2
```ruby
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

p arr       [ 1, 2, 3, 4, 5 ]
p newArr1   [ 2, 4, 6, 8, 10 ]
p newArr2   [ 1, 4, 9, 16, 25 ]
```

## Version 3
### Proc object
```ruby
def copyArrayDoSmth(arr,instructions)
   output = []
   arr.size.times { |i| output.push(instructions[arr[i]])}
   output
end

add = proc {|arg| arg + arg}
squar = proc {|arg| arg * arg}


arr = *1..5

newArr1 = copyArrayDoSmth(arr,add)
newArr2 = copyArrayDoSmth(arr,squar)

p arr       [ 1, 2, 3, 4, 5 ]
p newArr1   [ 2, 4, 6, 8, 10 ]
p newArr2   [ 1, 4, 9, 16, 25 ]
```


