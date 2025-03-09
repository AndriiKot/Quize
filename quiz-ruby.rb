require 'json'
require 'io/console'

path = ARGV[0] || './quize-ubuntu.json'
data = JSON.parse(File.read(path))

repeat_path = 'repeat.json'
existing_keys = File.exist?(repeat_path) ? JSON.parse(File.read(repeat_path)).keys : []

actions = {
  "exit?" => ->(key) { exit if key.casecmp? 'q' },
  "repeat" => ->(key, value) { puts 'You pressed Enter: continuing...', actions}, 
  "skip" => -> { puts "You pressed Space: Moving to the next question..." },
  "repeat_condition?" => ->(arg) { arg == "\r" || arg == "\n" },
  "skip_condition?" => ->(arg) { arg == " " },
  "save" => ->(key, value) { File.open(repeat_path, 'a')},
  "save_condition?" => ->(key) { existing_keys.include? key },
  "open_file_to_add" => ->(key, value) {},
  "add_to_repeat" => ->(key, value) {},
}


data.each do |arr|
  question, answer = arr[0], arr[1]

  puts "Press 'q' to exit:"
  puts "Press 'Enter' to repeat or 'Space' to continue"
  puts "Question: #{question}"
  
    key = STDIN.getch
    actions['exit?'][key]
    
    actions['repeat'].call(question, answer) if actions['repeat_condition?'][key]
    actions['skip'].call  if actions['skip_condition?'][key]
end
