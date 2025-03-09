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
  load: ->(file) { exits?(file) ? parse(file) : data[:default] },
}

p data[:load]['./data/test.json']

events = {
  game: {
    start: {
      repeat: ->(key, value) { p 'REPEAT ', key, value },
      skip: -> { puts "SKIP" },
    },
    end: {},
    exit: {},
    message: {},
},
  error: {},
  data: {},
}



#   "exit?" => ->(key) { exit if key.casecmp? 'q' },
#   "repeat" => ->(key, value) { puts 'You pressed Enter: continuing...',events},
#   "skip" => -> { puts "You pressed Space: Moving to the next question..." },
#   "repeat_condition?" => ->(arg) { arg == "\r" || arg == "\n" },
#   "skip_condition?" => ->(arg) { arg == " " },
#   "save" => ->(key, value) { File.open(repeat_path, 'a')},
#   "save_condition?" => ->(key) { existing_keys.include? key },
#   "open_file_to_add" => ->(key, value) {},
#   "add_to_repeat" => ->(key, value) {},
# }


# data.each do |arr|
#   question, answer = arr[0], arr[1]

#   puts "Press 'q' to exit:"
#   puts "Press 'Enter' to repeat or 'Space' to continue"
#   puts "Question: #{question}"

#     key = STDIN.getch
#   events['exit?'][key]

#   events['repeat'].call(question, answer) if events['repeat_condition?'][key]
#   events['skip'].call  if events['skip_condition?'][key]
# end
