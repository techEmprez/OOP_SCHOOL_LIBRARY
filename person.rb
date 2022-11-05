class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Randon.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    @parent_permission || is_of_age?
  end

  private :of_age?

  def of_age?
    @age >= 18
  end
end