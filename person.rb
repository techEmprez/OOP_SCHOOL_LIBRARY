class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Randon.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
