def distance(point1, point2)
  raise ArgumentError, "Both points must be arrays of length 2." unless point1.length == 2 && point2.length == 2

  x1, y1 = point1
  x2, y2 = point2

  Math.sqrt((x2 - x1)**2 + (y2 - y1)**2)
end

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def greet
    "Hello, my name is #{@name} and I am #{@age} years old."
  end

  def birthday
    @age += 1
    "Happy Birthday! You are now #{@age} years old."
  end
end

# ----------------------------------

puts "Hello Ruby"
puts ""
puts "Some simple calculation:\n"

point1 = [3, 4]
point2 = [7, 1]

dist = distance(point1, point2)
puts "The distance between points #{point1} and #{point2} is #{dist}"

person = Person.new("Alice", 30)
puts person.greet
puts person.birthday
puts person.greet
