require_relative '../student'

describe Student do
  student = Student.new(30, 'Musinguzi', false)
  describe 'Student details' do
    it 'should be of type Student' do
      expect(student.type).to eql('Student')
    end
    it "should have a shape of '¯(ツ)/¯'" do
      expect(student.play_hookey).to eql('¯\(ツ)/¯')
    end
  end
end
