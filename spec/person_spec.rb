require_relative '../person'

describe Person do
  context 'Unit Test: ' do
    it 'create a new Person when person class is instantiated' do
      new_person = Person.new(45, 'Prof. Blessing Blast', 234)
      expect(new_person.age).to eq 45
      expect(new_person.name).to eq 'Prof. Blessing Blast'
      expect(new_person.id).to eq 234
    end
  end
end
