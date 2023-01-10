require './app'
require './create_person'
require './create_book'
require './create_rental'

class Main
  def initialize
    @app = App.new
    @output = 0
  end

  def options
    print 'WELCOME TO THE SCHOOL LIBRARY APP'
    while @output != 7
      print "\nPlease choose an option by entering a number \n\n"
      print "1 - List all books \n"
      print "2 - List all people \n"
      print "3 - Create a person (teacher or student) \n"
      print "4 - Create a book \n"
      print "5 - Create a rental \n"
      print "6 - List all rentals for a person \n"
      print "7 - Quit \n"
      start_app
    end
  end

  def start_app
    @output = gets.chomp.to_i
    case @output
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      CreatePerson.new(@app.people).create_person
    when 4
      CreateBook.new(@app.books).create_book
    when 5
      CreateRental.new(@app.rentals).create_rental(@app)
    when 6
      @app.list_rentals
    end
  end
end

main = Main.new
main.options
