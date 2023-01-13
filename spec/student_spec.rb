require_relative '../student.rb'

describe Student do
  context 'Unit Test: ' do
    it 'create a new Student when Student class is instantiated' do
      new_student = Person.new(23, 'Elvis Markson')
      expect(new_student.age).to eq 23
      expect(new_student.name).to eq 'Elvis Markson'
    end
  end
end