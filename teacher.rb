require './person'

class Teacher < Person
  def initialize(name, specialization, age)
    super(age, name)
    @specialization = specialization
  end

  def can_use_service
    true
  end
end
