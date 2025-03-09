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
  load: ->(file) { exist?(file) && parse(file) || data[:default] },
}

data_arr = data[:load][ARGV[0]].to_a || []

events = {
  Q: -> { exit },
}

data_arr.to_a.each do |arr|
  question, answer = arr[0], arr[1]

  puts "\n\n Question: #{question}"
  print" Your answer: "
  STDIN.gets
  puts " Answer: #{answer}\n\n"
  puts " Press 'Q' to exit"
  puts " Press any key to continue"

  key = STDIN.getch.upcase.to_sym
  events[key]&.call
end
