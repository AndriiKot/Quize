boot = {
  libs: ['json', 'io/console'].freeze,
  utils: -> { Dir.glob("./utils/**/*.rb").freeze }.call,
  setup: -> {
              boot[:libs].each { |lib| require lib }
              boot[:utils].each { |util| require_relative util }
  }
}

boot[:setup].call

data = {
  default: parse('./data/quize-ubuntu.json'),
  load: ->(file) { exist?(file) && parse(file) ? parse(file) : data[:default] },
}

data_arr = data[:load][ARGV[0]].to_a || []
repeat_arr = []

events = {
  game: {
    start: {
      repeat: ->(key, question, answer) { {
        repeat_condition?: ->(arg) { arg == "\r" || arg == "\n" }[key],
        add: repeat_arr << [question, answer],
      }},
      skip: -> { puts "SKIP" },
    },
    end: {},
    exit: ->(key) { exit if key.casecmp? 'q' },
    message: {},
},
  error: {},
}


data_arr.each do |arr|
  question, answer = arr[0], arr[1]

  puts "Press 'q' to exit:"
  puts "Press 'Enter' to repeat or 'Space' to continue"
  puts "Question: #{question}"

  key = STDIN.getch

  events[:game][:exit].call(key)
  events[:game][:start][:repeat].call(key, question, answer)
  p data_arr
end

while repeat_arr.size > 0
  repeat_arr.reverse_each do |arr|
    question, answer = arr[0], arr[1]

    puts "Press 'q' to exit:"
    puts "Press 'Enter' to repeat or 'Space' to continue"
    puts "Question: #{question}"

    key = STDIN.getch

    events[:game][:exit].call(key)
    events[:game][:start][:repeat].call(key, question, answer)
    repeat_arr.pop
    puts "\n\n REPEAT ARRAY: #{repeat_arr} \n\n"
    p repeat_arr.size
  end
end
