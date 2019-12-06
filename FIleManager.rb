#FILE MANAGER by @madolu2

$path = Dir.pwd

def ListOfFiles
  puts "
TO LEAVE ENTER '<'
WANNA SORT IT? y/n
  "
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
      puts "
  NOW U IN '#{$path}'"
    end

    puts '
  TO LEAVE ENTER "<"
  ENTER SOURCE DIRECTORY
  JUMP TO ROOT FOLDER? y/n
  '
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
  puts '
TO LEAVE ENTER "<"
ENTER FILE NAME

'
  file_name = gets.chomp

  if file_name == "<"
    return nil
  end

  user_choice = $path + '/' + file_name
  begin
   File.delete(user_choice)
   puts '
DELETED
'
  rescue
    puts '
!ERROR - WRITE VALID FILE NAME!
'
  end
end

def DeleteByMask
  puts '
TO LEAVE ENTER "<"
ENTER MASK

'
  user_choice = gets.chomp

  if user_choice == "<"
    return nil
  end

  destination_dir = $path + '/' + user_choice

  File.delete(*Dir.glob(destination_dir))
  puts '
DELETED
'
end

def CreateFile
  puts "
TO LEAVE ENTER '<'
ENTER FILE NAME
"
  user_choice = gets.chomp

  if user_choice == "<"
    return nil
  end

  if user_choice != nil
    File.open(user_choice, 'w')
    puts "
FILE #{user_choice} WAS CREATED
"
  end
  return nil
end

def CopyFile
  puts "
TO LEAVE ENTER '<'
ENTER FILE NAME
  "

  file_name = gets.chomp
  user_choice = $path + '/' + file_name

  puts "
ENTER DESTINATION DIR
STAY '#{$path}'? y/n
  "

  destination_dir = gets.chomp

  if destination_dir == 'y'
    destination_dir = $path + '/' + file_name + 1.to_s
  else
    destination_dir += file_name
  end

  File.open(destination_dir, 'w')

  File.foreach(user_choice) do |line|
    File.foreach(destination_dir) do |dline|
      dline = line
    end
  end
end

puts 'HELLO THERE
IT`S FILE MANAGER'

while true
  puts "
  NOW U IN '#{$path}'"
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
