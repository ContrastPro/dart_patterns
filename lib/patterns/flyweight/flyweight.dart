void main() => _dartFlyweight();

void _dartFlyweight() {
  final List<ShapeFactory> shapes = [
    ShapeFactory("rectangle"),
    ShapeFactory("rectangle"),
    ShapeFactory("rectangle"),
    ShapeFactory("rectangle"),

    //
    ShapeFactory("circle"),
    ShapeFactory("circle"),
    ShapeFactory("circle"),
    ShapeFactory("circle"),
  ];

  for (int i = 0; i < shapes.length; i++) {
    shapes[i].shape.render();
  }
}

abstract class Shape {
  void render();
}

class Rectangle implements Shape {
  final String form;
  static const String texture = "texture 3000px";

  const Rectangle({this.form});

  @override
  void render() {
    print("$form with [$texture] render on screen...");
  }
}

class Circle implements Shape {
  final String form;
  static const String texture = "texture 5000px";

  const Circle({this.form});

  @override
  void render() {
    print("$form with [$texture] render on screen...");
  }
}

class ShapeFactory {
  static final Map<String, Shape> shapes = {};
  final Shape shape;

  ShapeFactory(String form) : shape = getType(form);

  static Shape getType(String form) {
    switch (form.toLowerCase()) {
      case "rectangle":
        return shapes.putIfAbsent(form, () {
          _printInfo(form: form);
          return Rectangle(form: form.toUpperCase());
        });
        break;
      default:
        return shapes.putIfAbsent(form, () {
          _printInfo(form: form);
          return Circle(form: form.toUpperCase());
        });
    }
  }

  static _printInfo({String form}) {
    print("Create ${form.toUpperCase()} shape");
  }
}
