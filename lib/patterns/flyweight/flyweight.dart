/**
 *
 * ## The essence of the pattern.
 *
 * * Flyweight is a structural design pattern that lets you fit more objects
 *   into the available amount of RAM by sharing common parts of state between
 *   multiple objects instead of keeping all of the data in each object.
 *
 *
 * ## Applicability.
 *
 * * Use the Flyweight pattern only when your program must support a huge number
 *   of objects which barely fit into available RAM.
 *
 *   The benefit of applying the pattern depends heavily on how and where
 *   it’s used. It’s most useful when:
 *
 *   - an application needs to spawn a huge number of similar objects
 *
 *   - this drains all available RAM on a target device
 *
 *   - the objects contain duplicate states which can be extracted and shared
 *   between multiple objects
 *
 *
 *
 * ## Implementation steps:
 *
 * (1) Divide fields of a class that will become a flyweight into two parts:
 *
 * (1.1) the intrinsic state: the fields that contain unchanging data
 *       duplicated across many objects
 *
 * (1.2) the extrinsic state: the fields that contain contextual data unique
 *       to each object
 */
abstract class Shape {
  void render();
}

/**
 * (2) Leave the fields that represent the intrinsic state in the class, but
 *     make sure they’re immutable. They should take their initial values only
 *     inside the constructor.
 */
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

/**
 * (3) Optionally, create a factory class to manage the pool of flyweights.
 *     It should check for an existing flyweight before creating a new one.
 *     Once the factory is in place, clients must only request flyweights
 *     through it. They should describe the desired flyweight by passing its
 *     intrinsic state to the factory.
 */
class ShapeFactory {
  static final Map<String, Shape> shapes = {};
  final Shape shape;

  ShapeFactory(String form) : shape = getType(form);

  /**
   * The getType() method takes a type's form, then the putIfAbsent() method on
   * Dart's Map class is used to check whether that type and its associated
   * data already exists in the cache.
   */
  static Shape getType(String form) {
    switch (form.toLowerCase()) {
      case "rectangle":
        /**
       * If the type is cached, putIfAbsent() simply returns it.
       */
        return shapes.putIfAbsent(
          form,
          () {
            _printInfo(form: form);
            return Rectangle(form: form.toUpperCase());
          },
        );
        break;
      default:
        return shapes.putIfAbsent(
          form,
          () {
            _printInfo(form: form);
            return Circle(form: form.toUpperCase());
          },
        );
    }
  }

  static _printInfo({String form}) {
    print("Create ${form.toUpperCase()} shape");
  }
}
