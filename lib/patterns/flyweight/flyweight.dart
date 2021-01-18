import 'dart:math';

void main() {
  bool useFlyweight = false;

  final List<IPositionedShape> listShapes = List<IPositionedShape>();

  final ShapeFactory shapeFactory = ShapeFactory();
  final ShapeFlyweightFactory flyweightFactory = ShapeFlyweightFactory();

  for (int i = 0; i < 10; i++) {
    listShapes.add(
      useFlyweight == true
          ? flyweightFactory.getShape(getRandomShape())
          : shapeFactory.createShape(getRandomShape()),
    );
  }

  listShapes.forEach((element) {
    element.render(Random().nextInt(400), Random().nextInt(400));
  });
}

ShapeType getRandomShape() {
  List<ShapeType> shapeType = ShapeType.values;
  return shapeType[Random().nextInt(shapeType.length)];
}

enum ShapeType { Circle, Square }

abstract class IPositionedShape {
  void render(int x, int y);
}

class Circle implements IPositionedShape {
  final String color;
  final double diameter;

  Circle({this.color, this.diameter}) {
    print("Created Circle <$color>...");
  }

  @override
  void render(int x, int y) {
    print("<$color> Circle with diameter $diameter Positioned on x: $x y: $y");
  }
}

class Square implements IPositionedShape {
  final String color;
  final double width;

  Square({this.color, this.width}) {
    print("Created Square <$color>...");
  }

  @override
  void render(int x, int y) {
    print("<$color> Square with width $width Positioned on x: $x y: $y");
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
        return Square(
          color: "BLUE",
          width: 12,
        );
    }
  }
}

class ShapeFlyweightFactory {
  final Map<ShapeType, IPositionedShape> _listShapes =
      Map<ShapeType, IPositionedShape>();

  IPositionedShape getShape(ShapeType shapeType) {
    switch (shapeType) {
      case ShapeType.Circle:
        return _listShapes.putIfAbsent(shapeType, () {
          return Circle(
            color: "RED",
            diameter: 10,
          );
        });
      default:
        return _listShapes.putIfAbsent(shapeType, () {
          return Square(
            color: "BLUE",
            width: 12,
          );
        });
    }
  }
}
