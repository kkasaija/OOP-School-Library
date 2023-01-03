# Nameable class
class Nameable
  def correct_name
    raise NotImplementedError
  end
end

# Person class
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def correct_name
    @name
  end

  def initialize(age, name, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
    true
  end

  private

  def of_age?
    @age >= 18
  end
end

# Base Decorator class
class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# Capitalize Decorator class
class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

# Capitalize Decorator class
class TrimmerDecorator < BaseDecorator
  def correct_name
    return @nameable.correct_name[0...10] if @nameable.correct_name.length > 10

    @nameable.correct_name
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
