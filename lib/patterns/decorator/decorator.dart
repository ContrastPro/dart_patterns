/**
 *
 * ## The essence of the pattern.
 *
 * * Decorator is a structural design pattern that lets you attach new
 *   behaviors to objects by placing these objects inside special wrapper
 *   objects that contain the behaviors.
 *
 *
 * ## Analogy from life.
 *
 * * Wearing clothes is an example of using decorators. When you’re cold, you
 *   wrap yourself in a sweater. If you’re still cold with a sweater, you can
 *   wear a jacket on top. If it’s raining, you can put on a raincoat. All of
 *   these garments “extend” your basic behavior but aren’t part of you, and
 *   you can easily take off any piece of clothing whenever you don’t need it.
 *
 *
 * ## Applicability.
 *
 * * Use the Decorator pattern when you need to be able to assign extra
 *   behaviors to objects at runtime without breaking the code that uses
 *   these objects.
 *
 *   The Decorator lets you structure your business logic into layers, create a
 *   decorator for each layer and compose objects with various combinations of
 *   this logic at runtime. The client code can treat all these objects in the
 *   same way, since they all follow a common interface.
 *
 * * Use the pattern when it’s awkward or not possible to extend an object’s
 *   behavior using inheritance.
 *
 *   Dart, have a final keyword that can block class inheritance. For a final
 *   class, the only way to reuse the existing behavior would be to wrap the
 *   class with your own wrapper, using the Decorator pattern.
 *
 *
 * ## Implementation steps:
 *
 * (1) Create a component interface that describes common methods for both the
 *     main component and its extensions.
 *
 * (2) Figure out what methods are common to both the primary component and
 *     the optional layers. Create a component interface and declare those
 *     methods there.
 */
abstract class Shape {
  String draw();
}

/**
 * (3) Create a concrete component class and define the base behavior in it.
 *
 * It must have a field to store a reference to the nested component object.
 * All methods of the base decorator must delegate action to the nested object.
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
 * (4) Create a base decorator class. It should have a field for storing a
 *     reference to a wrapped object. The field should be declared with the
 *     component interface type to allow linking to concrete components
 *     as well as decorators. The base decorator must delegate all work to the
 *     wrapped object.
 */
abstract class ShapeDecorator implements Shape {
  final Shape shape;

  ShapeDecorator(this.shape);

  @override
  String draw();
}

/**
 * (5) Make sure all classes implement the component interface.
 *
 * (6) reate concrete decorators by extending them from the base decorator.
 *     A concrete decorator must execute its behavior before or after the call
 *     to the parent method (which always delegates to the wrapped object).
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
