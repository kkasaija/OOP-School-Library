require_relative '../book'

describe Book do
  context 'Book Class Unit test' do
    it 'Create a new book when book class is instantiated' do
      book = Book.new('Introduction to CS', 'Ruby Spec')
      expect(book.title).to eq 'Introduction to CS'
      expect(book.author).to eq 'Ruby Spec'
    end
  end
end