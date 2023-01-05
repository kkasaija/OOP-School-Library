require './teacher'
require './book'
require './rental'
require './student'

class App
  attr_accessor :books, :teachers, :students, :rentals

  def initialize
    @teachers = []
    @books = []
    @rentals = []
    @students = []
  end

  def list_books
    @books.each_with_index { |book, n| print "(#{n}) Title: \"#{book.title}\", Author: \"#{book.author}\"\n" }
  end

  def list_people
    people = [*@teachers, *@students]
    people.each_with_index { |person, i| print "(#{i}) Name: \"#{person.name}\", Age: \"#{person.age}\"\n" }
  end

  def create_person
    print 'To create a person, type (1) for Student or (2) for Teacher: '
    input = gets.chomp.to_i
    case input
    when 1
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print 'Enter Classroom: '
      classroom = gets.chomp
      new_student = Student.new(age, classroom)
      new_student.name = name
      @students << new_student
      puts "#{new_student.name} added successfully"
    when 2
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      new_teacher = Teacher.new(age, name, specialization)
      new_teacher.name = name
      @teachers << new_teacher
      puts "#{new_teacher.name} added successfully"
    end
  end

  def create_book
    print 'Book Title:'
    title = gets.chomp
    print 'Book Author:'
    author = gets.chomp
    new_book = Book.new(title, author)
    @books << new_book
    puts "#{new_book.title} created successfully"
  end

  def create_rental
    print "Select a book from the following list by number \n"
    list_books
    book = gets.chomp.to_i
    print "select a person \n"
    list_people
    person = gets.chomp.to_i
    print 'select a date'
    date = gets.chomp
    people = [*@teachers, *@students]
    new_rental = Rental.new(date, @books[book], people[person])
    @rentals << new_rental
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'Enter person id'
    id = gets.chomp
    @rentals.each do |i|
      print "Date: #{i.date}, Title: #{i.book.title}, Author: #{i.book.author}\n" if id == i.person.id
    end
  end
end
