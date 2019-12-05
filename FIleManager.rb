#List of files in directory
#User may sort files
require 'pathname'

$path = Dir.pwd

def ListOfFiles
  while true
    puts '
  TO LEAVE ENTER "back"
  ENTER SOURCE DIRECTORY
  USE PRESET? y/n
  '
    user_choice = gets.chomp

    if user_choice == 'y'
      path = $path
    elsif user_choice == "back"
      return nil
    end

    puts '
  WANNA SORT IT? y/n
    '
    user_choice = gets.chomp

    if user_choice == 'y'
      puts Dir.entries(path).sort
    elsif user_choice == "back"
      return nil
    else
      puts Dir.entries(path)
    end
  end
end

def JumpTo
  while true
    if $path != nil
      puts "
  NOW U IN '#{$path}'"
    end

    puts '
  TO LEAVE ENTER "back"
  ENTER SOURCE DIRECTORY
  USE PRESET? y/n
  '
    user_choice = gets.chomp

    if user_choice == 'y'
      $path = Dir.pwd
    elsif user_choice == "back"
      return nil
    else
      $path = user_choice
    end

  end
end

def DeleteByName

end

def DeleteByMask

end

def CreateFile

end

def CopyFile

end

puts 'HELLO THERE
IT`S FILE MANAGER'

while true
  puts "
  NOW U IN'#{$path}'"
  puts '
  WHAT WE GONNA DO?
  1.LIST OF FILES IN DIR
  2.JUMP TO DIR
  3.DELETE FILE BY NAME
  4.DELETE FILE BY MASK
  5.CREATE FILE
  6.COPY FILE
  '
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
