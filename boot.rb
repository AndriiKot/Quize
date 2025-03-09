
get_configs  = Dir.glob("./configs/**/*.rb")

get_configs.each { |config| require_relative config }
