require_relative '../book'
require_relative '../person.rb'
require_relative '../rental.rb'

describe Book do
  context 'Book Class Unit test' do
    it 'Create a new book when book class is instantiated' do
      book = Book.new('Introduction to CS', 'Ruby Spec')
      expect(book.title).to eq 'Introduction to CS'
      expect(book.author).to eq 'Ruby Spec'
    end
  end

  context 'Add Rental Method' do
    book = Book.new('Introduction to CS', 'Ruby Spec')
    person = Person.new(45, 'Prof. Blessing Blast', 234)
    date = '23/01/12'
    it 'can Add Book rental' do
      expect(book.add_rental(person, date).date).to eq('23/01/12')
      expect(book.add_rental(person, date).book.title).to eq('Introduction to CS')
      expect(book.add_rental(person, date).person.name).to eq('Prof. Blessing Blast')
    end
  end
end
