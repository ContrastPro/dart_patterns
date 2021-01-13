void main() {

}

enum ShapeType { Circle, Square }

abstract class IPositionedShape {
  void render(int x, int y);
}

class Circle implements IPositionedShape {
  final String color;
  final double diameter;

  Circle({this.color, this.diameter}) {
    print("Created Circle...");
  }

  @override
  void render(int x, int y) {
    print("$color Circle with diameter $diameter Positioned on x: $x y: $y");
  }
}

class Square implements IPositionedShape {
  final String color;
  final double width;

  Square({this.color, this.width}) {
    print("Created Square...");
  }

  @override
  void render(int x, int y) {
    print("$color Square with width $width Positioned on x: $x y: $y");
  }
}

class ShapeFactory {
  IPositionedShape createShape(ShapeType shapeType) {
    switch (shapeType) {
      case ShapeType.Circle:
        return Circle(
          color: "RED",
          diameter: 10,
        );
      default:
        return Circle(
          color: "BLUE",
          diameter: 12,
        );
    }
  }
}

class ShapeFlyweightFactory {

}
