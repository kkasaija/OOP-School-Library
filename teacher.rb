require './person'

class Teacher < Person
  attr_accessor :specialization

  def can_use_services?
    true
  end
end
