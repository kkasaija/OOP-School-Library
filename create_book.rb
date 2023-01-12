require './persist.rb'

class CreateBook
  def initialize(book)
    @books = book
  end

  def create_book
    title, author = collect_book
    new_book = Book.new(title, author)
    add_to_collection(new_book)
    store_books
  end

  private

  def collect_book
    print 'Book Title: '
    title = gets.chomp
    print 'Book Author: '
    author = gets.chomp
    [title, author]
  end

  def add_to_collection(new_book)
    @books.push(new_book)
    puts "#{new_book.title} created successfully! "
  end

  def store_books
    stored_books = Persist.new('books.json')
    books = stored_books.load
    @books.each do |book|
      books << { title: book.title, author: book.author }
    end
    stored_books.save(books)
  end
end
