/**
 *
 * ## The essence of the pattern.
 *
 * * A decorator is a structural design pattern that allows you to dynamically
 *   add new functionality to objects by wrapping them in useful "wrappers".
 *
 *
 * ## Analogy from life.
 *
 * * Any clothing is an analogue of the Decorator. By using the Decorator, you do not
 *   change the original class or create any child classes. So with clothes - putting on
 *   a sweater, you do not stop being yourself, but you get a new property - protection
 *   from the cold. You can go further and put on another decorator on top - a raincoat
 *   to protect yourself from the rain.
 *
 *
 * ## Applicability.
 *
 * * When you need to add responsibilities to objects on the fly, it's invisible to the
 *   code that uses them.
 *
 *   Objects are wrapped with additional behaviors. The wrappers and the objects themselves
 *   have the same interface, so clients don't care what to work with - with a regular
 *   data object or with a wrapped one.
 *
 * * When you can't extend the responsibilities of an object through inheritance.
 *
 *   Dart, have a final keyword that can block class inheritance. Such classes
 *   can only be extended using the Decorator.
 *
 *
 * ## Implementation steps:
 *
 * (1) Create a component interface that describes common methods for both the main
 *     component and its extensions.
 */
abstract class Shape {
  String draw();
}
/**
 * (2) Create a concrete component class and put the main business logic in it.
 */
class Square implements Shape {
  @override
  String draw() => "Square";
}

class Triangle implements Shape {
  @override
  String draw() => "Triangle";
}
/**
 * (3) Create a base decorator class. It must have a field to store a reference to the
 *     nested component object. All methods of the base decorator must delegate action
 *     to the nested object.
 */
abstract class ShapeDecorator implements Shape {
  final Shape shape;

  ShapeDecorator(this.shape);

  @override
  String draw();
}
/**
 * (4) Now create concrete decorator classes inheriting from the base decorator.
 *     The concrete decorator must perform its additional function, and then (or before)
 *     call the same operation on the wrapped object.
 */
class GreenShapeDecorator extends ShapeDecorator {
  GreenShapeDecorator(Shape shape) : super(shape);

  @override
  String draw() => "Green ${shape.draw()}";
}

class BlueShapeDecorator extends ShapeDecorator {
  BlueShapeDecorator(Shape shape) : super(shape);

  @override
  String draw() => "Blue ${shape.draw()}";
}
