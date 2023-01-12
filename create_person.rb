require './persist'

class CreatePerson
  def initialize(people)
    @people = people
  end

  def create_person
    input = collect_input
    case input
    when 1
      new_student = create_student
      add_to_collection(new_student)
      store_person("student")

    when 2
      new_teacher = create_teacher
      add_to_collection(new_teacher)
      store_person("teacher")

    else
      puts 'Sorry, The selected option is not defined '
      create_person
    end
  end

  private

  def collect_input
    print 'To create a person, type (1) for Student or (2) for Teacher: '
    gets.chomp.to_i
  end

  def age_name
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    [age, name]
  end

  def collect_specialization
    print 'Specialization: '
    gets.chomp
  end

  def permission_get
    print 'Has parent permission? [Y/N]: '
    gets.chomp.downcase
  end

  def create_student
    age, name = age_name
    allowed = permission_get
    Student.new(age, name, allowed)
  end

  def create_teacher
    age, name = age_name
    specialization = collect_specialization
    Teacher.new(age, name, specialization)
  end

  def add_to_collection(person)
    @people.push(person)
    puts "#{person.name} added successfully! "
  end

  def store_person(type)
    stored_people = Persist.new('person.json')
    people = stored_people.load
    @people.each do |person|
      people << { age: person.age, name: person.name, id: person.id, type: type }
    end
    stored_people.save(people)
  end
end
