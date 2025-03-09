def parse(file_path)
  file_path = '' unless file_path.is_a?(String)
  JSON.parse(File.read(file_path))
rescue Errno::ENOENT
  puts "File not found: #{file_path.inspect}"
rescue JSON::ParserError
  puts "Error parsing JSON in file: #{file_path.inspect}"
end
