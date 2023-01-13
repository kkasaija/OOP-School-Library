require './rental'
require './persist'

class CreateRental
  def initialize(rent)
    @rentals = rent
  end

  def create_rental(app)
    book, person, date = collect_data(app)
    choosen_book = load_book_store[book]
    new_book = Book.new(choosen_book['title'], choosen_book['author'])

    chosen_person = load_person_store[person]
    new_person = Person.new(chosen_person['age'], chosen_person['name'], chosen_person['id'])

    new_rental = Rental.new(date, new_book, new_person)
    update(new_rental)
    store_rentals
  end

  private

  def collect_data(app)
    print "Select a book from the following list by number \n"
    app.list_books
    book = gets.chomp.to_i
    print "select a person from the following list by number (not id) \n"
    app.list_people
    person = gets.chomp.to_i
    print 'select a date [format: yyyy/mm/dd]: '
    date = gets.chomp

    [book, person, date]
  end

  def update(new_rental)
    @rentals << new_rental
    puts 'Rental created successfully'
  end

  def load_book_store
    load_books = Persist.new('books.json')
    load_books.load
  end

  def load_person_store
    load_person = Persist.new('person.json')
    load_person.load
  end

  def store_rentals
    stored_rentals = Persist.new('rentals.json')
    rentals = stored_rentals.load

    @rentals.each do |rental|
      rentals << { date: rental.date, book_title: rental.book.title, book_author: rental.book.author,
                   person_name: rental.person.name, person_id: rental.person.id }
    end
    stored_rentals.save(rentals)
  end
end
