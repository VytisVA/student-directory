@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts "Input the students option selected".center(75)
    input_students
    
  when "2"
    puts "Show the students option selected".center(75)
    show_students
  when "5"
    exit
  when "3"
    puts "Save the list option selected".center(75)
    save_students  
  when "4"
    puts "Load the list option selected".center(75)
    load_students
  else
    puts "I don't know what you meant, try again".center(75)
  end
end

def input_students
  puts "Please enter the names of the students".center(75)
  puts "To finish, just hit return twice".center(75)
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students".center(75)
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(75)
  puts "--------------------------------".center(75)
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(75)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(75)
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}".center(75)
  else
    puts "Sorry, #{filename} doesn't exist.".center(75)
    exit
  end
end

try_load_students
interactive_menu