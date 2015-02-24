class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def salary_sum
    sum = 0

    @employees.each do |e|
      sum += e.salary
      sum += e.salary_sum if e.class == Manager
    end

    sum
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    salary_sum * multiplier
  end

end
