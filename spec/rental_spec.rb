require_relative '../rental'
require_relative '../teacher'
require_relative '../book'

describe Book do
  context 'Rental class Unit Test' do
    it 'Create a new Rental when rental class is instantiated' do
      teacher = Teacher.new(40, 'Prof. Stan', 'Sociology')
      book = Book.new('title', 'author')
      rental = Rental.new('2023-01-12', book, teacher)
      expect(rental.book.rentals.length).to eq 1
      expect(rental.person.rentals.length).to eq 1
    end
  end
end
