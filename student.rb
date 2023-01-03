require './person'

class Student < Person
  attr_accessor :classroom

  def play_hooky
    '¯\(ツ)/¯'
  end
end
