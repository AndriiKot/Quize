
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
  libs: ['json', 'io/console'],
  utils: -> { Dir.glob("./utils/**/*.rb") }.call,
  data: ->(file){ Dir.glob("./data/**/#{file}.json") },
  setup: -> {
              events[:libs].each { |lib| require lib }
              events[:utils].each { |util| require_relative util }
  },
}

events[:setup].call

p events[:data]['quize-ubuntu']

# repeat_path = 'repeat.json'
# existing_keys = File.exist?(repeat_path) ? JSON.parse(File.read(repeat_path)).keys : []

# p parse(path)

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
