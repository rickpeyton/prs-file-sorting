require 'fileutils'
@source_dir = "/Users/rick/Desktop/Fake Google Drive"
@destination_dir = "/Users/rick/Desktop/Fake PRS"
# Change the current working directory to the Google Drive
Dir.chdir(@source_dir)

def check_directory prefix, filename
  Dir.chdir(@destination_dir)
  if File.directory?(prefix)
    Dir.chdir("#{@destination_dir}/#{prefix}")
    if File.exists?(filename)
      Dir.chdir(@source_dir)
      return true
    else
      Dir.chdir(@source_dir)
      return false
    end
  else
    FileUtils.mkdir prefix
    Dir.chdir(@source_dir)
    return false
  end
end

google_drive = Dir.new(@source_dir)
google_drive.each do |file_name|
  file = File.new(file_name)
  three_days_ago = Time.now - ((60 * 60 * 24) * 3)
  if file.mtime > three_days_ago
    case
    when file_name.start_with?("2") && file_name.end_with?("pdf")
      if check_directory(file_name[0..2], file_name) == false
        FileUtils.cp(file_name, "#{@destination_dir}/#{file_name[0..2]}")
      end
    when file_name.start_with?("FRONT_")
      if check_directory("F_#{file_name[6..8]}", file_name) == false
        FileUtils.cp(file_name,
                     "#{@destination_dir}/F_#{file_name[6..8]}")
      end
    when file_name.start_with?("BACK_")
      if check_directory("F_#{file_name[5..7]}", file_name) == false
        FileUtils.cp(file_name,
                     "#{@destination_dir}/F_#{file_name[5..7]}")
      end
    when file_name.start_with?("ENV_FRONT_")
      if check_directory("F_#{file_name[10..12]}", file_name) == false
        FileUtils.cp(file_name,
                     "#{@destination_dir}/F_#{file_name[10..12]}")
      end
    when file_name.start_with?("ENV_BACK_")
      if check_directory("F_#{file_name[9..11]}", file_name) == false
        FileUtils.cp(file_name,
                     "#{@destination_dir}/F_#{file_name[9..11]}")
      end
    when file_name.start_with?("ENV_")
      if check_directory("F_#{file_name[4..6]}", file_name) == false
        FileUtils.cp(file_name,
                     "#{@destination_dir}/F_#{file_name[4..6]}")
      end
    when file_name.start_with?("packslip_")
      if check_directory("F_#{file_name[9..11]}", file_name) == false
        FileUtils.cp(file_name,
                     "#{@destination_dir}/F_#{file_name[9..11]}")
      end
    end
  end
end
