require_relative '../student'
require_relative '../classroom'

describe Classroom do
  classroom = Classroom.new('Primary 7')
  describe 'Classroom Details' do
    it 'should have a label of Primary 7' do
      expect(classroom.label).to eql('Primary 7')
    end
  end
end
