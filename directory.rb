def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return/enter twice"

  students = []
  # lets user input name of student
  name = gets.chomp
  # if name is not empty, will do this
  while !name.empty? do
    # add name with key name and november with key cohort to student hash
    students << {name: name, cohort: :november}
    #counts the new total of students after one is added
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of the Academy of Evil"
  puts"---------------"
end

#iterates through hash of students to print their names and cohort
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
#prints count of students in hash
def print_footer(students)
  puts "Overall we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
