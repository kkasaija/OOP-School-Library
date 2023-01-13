# class Nameable
class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unkonwn', id = Random.rand(1..1000), parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_service
    @parent_permission || @age >= 18
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age
    @age >= 18
  end

  def correct_name
    @name
  end
end

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

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    return @nameable.correct_name[0...10] if @nameable.correct_name.length > 10

    @nameable.correct_name
  end
end
