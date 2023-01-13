require './spec_helper'

describe Classroom do
  classroom = Classroom.new('Primary 7')
  describe 'Classroom Details' do
    it 'should have a label of Primary 7' do
      expect(classroom.label).to eql('Primary 7')
    end
    it 'should add student to class' do
      classroom.add_student(Student.new(14, 'John', false))
      expect(classroom.students.length).to eq(1)
    end
  end
end
