require_relative '../student'
require_relative '../classroom'

describe Classroom do
  classroom = Classroom.new('Primary 7')
  context 'Classroom Details' do
    it 'should have a label of Primary 7' do
      expect(classroom.label).to eql('Primary 7')
    end
  end
  context 'Add student:' do
    it 'Should add Student' do
      student = Student.new(30, 'Musinguzi', 'Pri-5')
      expect(student.classroom).to eq('Pri-5')
    end
  end
end
