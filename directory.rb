def input_students
  puts "Please enter the names of the students".center(75)
  puts "To finish, just hit return twice".center(75)
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    if students.count == 1
      puts "Now we have #{students.count} student".center(75)
    else
      puts "Now we have #{students.count} students".center(75)
    end      
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(75)
  puts "--------------------------------".center(75)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(75)
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student".center(75)
  else
    puts "Overall, we have #{students.count} great students".center(75)
  end    
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)