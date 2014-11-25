# Change the current working directory to the Google Drive
Dir.chdir("/Users/printswell/Desktop/Fake Google Drive")

google_drive = Dir.new("/Users/printswell/Desktop/Fake Google Drive")
google_drive.each do |file_name|
  file = File.new(file_name)
  three_days_ago = Time.now - ((60 * 60 * 24) * 3)
  if file.mtime > three_days_ago
    case
    when file_name.start_with?("2")
      if File.directory?(file_name[0..2])
        puts "yes"
      else
        puts "no"
      end
    when file_name.start_with?("FRONT_")
    when file_name.start_with?("BACK_")
    when file_name.start_with?("ENV_")
    when file_name.start_with?("ENV_FRONT_")
    when file_name.start_with?("ENV_BACK_")
    when file_name.start_with?("packslip_")
    end
  end
end
