void main() {
  final Shape greenSquare = GreenShape(Square());
  final Shape greenCircle = GreenShape(Circle());

  print(greenSquare.draw());
  print(greenCircle.draw());

}

abstract class Shape {
  String draw();
}

class Square implements Shape {
  @override
  String draw() => "Square";
}

class Circle implements Shape {
  @override
  String draw() => "Circle";
}

abstract class ShapeDecorator implements Shape {
  final Shape shape;

  ShapeDecorator(this.shape);

  @override
  String draw() => shape.draw();
}

class GreenShape extends ShapeDecorator {
  GreenShape(Shape shape) : super(shape);

  @override
  String draw() => "Green ${shape.draw()}";
}
