require './teacher'
require './book'
require './rental'
require './student'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def list_books
    @books.each_with_index { |book, n| print "(#{n}) Title: #{book.title}, Author: #{book.author}\n" }
  end

  def list_people
    @people.each_with_index do |person, i|
      print "(#{i}) #{person.is_a?(Student) ? '[Student]' : '[Teacher]'} "
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_rentals
    print 'Enter person id '
    id = gets.chomp
    @rentals.each do |i|
      print "Date: #{i.date}, Title: #{i.book.title}, Author: #{i.book.author}\n" if id == i.person.id
    end
  end
end
