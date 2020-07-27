@students = [] #empty array accessible to all methods

#main program loop, gives menu options then runs selection
def interactive_menu
  loop do
    print_menu
    #get user input
    process(STDIN.gets.chomp)
  end
end

#prints menu options
def print_menu
  puts "What would you like to do?"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save directory to students.csv"
  puts "4. Load directoy from students.csv"
  puts "9. Exit"
end

#runs method based on item chosen from menu
def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
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
  name = STDIN.gets.chomp
  # if name is not empty, will do this
  while !name.empty? do
    # add name with key name and november with key cohort to student hash
    @students << {name: name, cohort: :november}
    #counts the new total of students after one is added
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

#prints list of students with header and footer
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

def load_students(filename = students.csv)
  #open file with read permissions
  file = File.open(filename, "r")
  #interate over lines in csv adding them to students hash
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def check_for_file
  #load first argument from command line
  filename = ARGV.first
  #exit method if an argument given
  return if filename.nil?
  #load students from csv if argument given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  #exit program if filename given does not exist
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
end
check_for_file
interactive_menu
