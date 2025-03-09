def exist?(file_path)
  file_path = '' unless file_path.is_a?(String)
  File.exist?(file_path)
end
