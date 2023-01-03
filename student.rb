require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom = 'Unknown')
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end
end
