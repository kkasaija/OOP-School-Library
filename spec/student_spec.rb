require_relative '../student'

describe Student do
  student = Student.new(30, 'Musinguzi', "class-6")
  describe 'Student details' do
    it 'should be of type Student' do
      expect(student.age).to eql(30)
    end
    it "should have a shape of '¯(ツ)/¯'" do
      expect(student.play_hooky).to eql('¯(ツ)/¯')
    end
    it "should belong to 'class-6' classroom" do
      expect(student.classroom).to eql("class-6")
    end

  end
end
