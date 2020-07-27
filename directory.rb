def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return/enter twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of the Academy of Evil"
  puts"---------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall we have #{student.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
