require 'date'
require 'delegate'

class Employee
  attr_accessor :name, :hire_date

  def initialize(name, hire_date)
    @name = name
    @hire_date = hire_date
  end
end

class EmployeeDecorator < SimpleDelegator
  def years_employed
    Time.now.year - hire_date.year
  end

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end
end

employee = Employee.new("John Doe", Date.new(1995, 10, 10))
employee_dec = EmployeeDecorator.new(employee)

puts employee_dec.first_name
puts employee_dec.last_name
puts employee_dec.years_employed