number_files = []
front_files = []
back_files = []
env_files = []
env_front_files = []
env_back_files = []
packslip_files = []

# Change the current working directory to the Google Drive
Dir.chdir("/Users/rick/Desktop/Fake Google Drive")
google_drive = Dir.new("/Users/rick/Desktop/Fake Google Drive")
google_drive.each do |file_name|
  file = File.new(file_name)
  three_days_ago = Time.now - ((60 * 60 * 24) * 3)
  if file.mtime > three_days_ago
    number_files << file_name if file_name.start_with?("2")
    front_files << file_name if file_name.start_with?("FRONT_")
    back_files << file_name if file_name.start_with?("BACK_")
    env_files << file_name if file_name.start_with?("ENV_")
    env_front_files << file_name if file_name.start_with?("ENV_FRONT_")
    env_back_files << file_name if file_name.start_with?("ENV_BACK_")
    packslip_files << file_name if file_name.start_with?("packslip_")
  end
end

p number_files
