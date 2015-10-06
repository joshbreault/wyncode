class Quadrilateral
end
class Rectangle < Quadrilateral
end
class Trapezoid < Quadrilateral
end
class Square < Rectangle
end
class Rhombus < Trapezoid
end
def test
  squa = Square.new
  puts squa.is_a? Rectangle
  puts squa.is_a? Quadrilateral

  rect = Rectangle.new
  puts rect.is_a? Quadrilateral
  puts not(rect.is_a? Trapezoid)

  rhomb = Rhombus.new
  puts rhomb.is_a? Trapezoid
  puts rhomb.is_a? Quadrilateral

  trap = Trapezoid.new
  puts trap.is_a? Quadrilateral
  puts not(trap.is_a? Rectangle)

  quad = Quadrilateral.new
  puts !(quad.is_a? Rhombus)
  puts !(quad.is_a? Trapezoid)
  puts !(quad.is_a? Rectangle)
  puts !(quad.is_a? Square)
end

test