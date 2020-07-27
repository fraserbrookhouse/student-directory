@students = [] #empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    #get user input
    process(gets.chomp)
  end
end

def print_menu
  puts "What would you like to do?"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save directory to students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "Invalid input, please try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return/enter twice"
  # lets user input name of student
  name = gets.chomp
  # if name is not empty, will do this
  while !name.empty? do
    # add name with key name and november with key cohort to student hash
    @students << {name: name, cohort: :november}
    #counts the new total of students after one is added
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of the Academy of Evil"
  puts"---------------"
end

#iterates through hash of students to print their names and cohort
def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
#prints count of students in hash
def print_footer
  puts "Overall we have #{@students.count} great students"
end

def save_students
  #open file for writing
  file = File.open("students.csv", "w")
  #iterate over student array, extract each students data to a single string to write to csv
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu
