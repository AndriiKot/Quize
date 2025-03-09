def parse(file_path)
  JSON.parse(File.read(file_path))
rescue Errno::ENOENT
  puts "File not found: #{file_path}"
  nil
rescue JSON::ParserError
  puts "Error parsing JSON in file: #{file_path}"
  nil
end
