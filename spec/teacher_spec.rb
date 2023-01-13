require_relative '../teacher'

describe Teacher do
  teacher = Teacher.new(60, 'Kenneth', 'Mathematics')
  describe 'Teacher Details' do
    it 'should be of type Teacher' do
      expect(teacher.type).to eql('Teacher')
    end
    it 'should be able to use services' do
      expect(teacher.can_use_services?).to eql(true)
    end
  end
end
