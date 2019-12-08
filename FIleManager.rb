#List of files in directory
#User may sort files
require 'fileutils'

$path = Dir.pwd

def ListOfFiles
  puts "\nTO LEAVE PRESS '<'\n" \
       "WANNA SORT IT? y/n\n\n"
  user_choice = gets.chomp

  if user_choice == 'y'
    puts Dir.entries($path).sort
  elsif user_choice == '<'
    return nil
  else
    puts Dir.entries($path)
  end
  return nil
end

def JumpTo
  while true
    if $path != nil
      puts "\nNOW U IN '#{$path}'\n"
    end

    puts "\nTO LEAVE PRESS '<'\n" \
         "ENTER SOURCE DIRECTORY\n" \
         "JUMP TO ROOT FOLDER? y/n\n\n"

    user_choice = gets.chomp

    if user_choice == 'y'
      $path = '/'
    elsif user_choice == "<"
      return nil
    else
      $path = user_choice + '/'
    end
  end
end

def DeleteByName
  puts "\nTO LEAVE PRESS '<'\n\
  ENTER FILE NAME\n\n"
  file_name = gets.chomp

  if file_name == "<"
    return nil
  end

  user_choice = $path + '/' + file_name
  begin
   File.delete(user_choice)
   puts "\nDELETED\n"
  rescue
    puts "\n!ERROR - WRITE VALID FILE NAME!\n"
  end
end

def DeleteByMask
  puts "\nTO LEAVE PRESS '<'\n" \
        "ENTER MASK\n\n"
  user_choice = gets.chomp

  if user_choice == "<"
    return nil
  end

  destination_dir = $path + '/' + user_choice

  File.delete(*Dir.glob(destination_dir))
end

def CreateFile
  puts "\nTO LEAVE PRESS '<'\n" \
       "ENTER FILE NAME\n\n"
  user_choice = gets.chomp

  if user_choice == "<"
    return nil
  end

  if user_choice != nil
    File.open(user_choice, 'w')
    puts "\nFILE #{user_choice} WAS CREATED\n"
  end
  return nil
end

def CopyFile
  puts "\nTO LEAVE PRESS '<'\n" \
       "ENTER FILE NAME\n\n"

  file_name = gets.chomp
  user_choice = $path + '/' + file_name

  if file_name == "<"
    return nil
  end

  puts "\nENTER DESTINATION DIR\n" \
       "STAY '#{$path}'? y/n\n\n"

  destination_dir = gets.chomp

  if destination_dir == 'y'
    destination_dir = $path + '/' + file_name + 1.to_s
  else
    destination_dir += file_name
  end

  File.open(destination_dir, 'w')

  File.foreach(user_choice) do |line|
    File.open(destination_dir, 'a') do |file|
      file.puts line
    end
  end
end

puts "\nHELLO THERE\n" \
     "IT`S FILE MANAGER\n"

while true
  puts "
  NOW U IN '#{$path}'\n
  WHAT WE GONNA DO?\n\
  1.LIST OF FILES IN DIR\n\
  2.JUMP TO DIR\n\
  3.DELETE FILE BY NAME\n\
  4.DELETE FILE BY MASK\n\
  5.CREATE FILE\n\
  6.COPY FILE\n\n"
  user_choice = gets.chomp.to_i

  case user_choice
  when 1
    ListOfFiles()
  when 2
    JumpTo()
  when 3
    DeleteByName()
  when 4
    DeleteByMask()
  when 5
    CreateFile()
  when 6
    CopyFile()
  end

end
