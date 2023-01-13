require './teacher'
require './book'
require './rental'
require './student'
require './persist'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def list_books
    load_books = Persist.new('books.json')
    books = load_books.load
    if books.empty?
      puts 'No books found'
    else
      books.each_with_index { |book, n| print "(#{n}) Title: \"#{book['title']}\", Author: \"#{book['author']}\"\n" }
    end
  end

  def list_people
    stored_people = Persist.new('person.json')
    loaded_people = stored_people.load

    if loaded_people.empty?
      puts 'No record is found'
    else
      loaded_people.each_with_index do |person, i|
        print "(#{i}) #{person['type'] == 'student' ? '[Student]' : '[Teacher]'}"
        puts "Name: '#{person['name']}', Id: '#{person['id']}', Age: '#{person['age']}'"
      end
    end
  end

  def list_rentals
    stored_rentals = Persist.new('rentals.json')
    loaded_rentals = stored_rentals.load

    if loaded_rentals.empty?
      puts 'No record is found'
    else
      print 'Enter person id: '
      id = gets.chomp.to_i

      loaded_rentals.each do |rental|
        if id == rental['person_id']
          print "Date: #{rental['date']}, Title: '#{rental['book_title']}', Author: '#{rental['book_author']}'\n"
        end
      end
    end
  end
end
