/**
 *
 * ## The essence of the pattern.
 *
 * * Prototype is a creational design pattern that lets you copy existing
 *   objects without making your code dependent on their classes.
 *
 *
 * ## Analogy from life.
 *
 * * Since industrial prototypes don’t really copy themselves, a much closer
 *   analogy to the pattern is the process of mitotic cell division
 *   (biology, remember?). After mitotic division, a pair of identical cells is
 *   formed. The original cell acts as a prototype and takes an active role in
 *   creating the copy.
 *
 *
 * ## Applicability.
 *
 * * Use the Prototype pattern when your code shouldn’t depend on the concrete
 *   classes of objects that you need to copy.
 *
 *   This happens a lot when your code works with objects passed to you from 3
 *   rd-party code via some interface. The concrete classes of these objects are
 *   unknown, and you couldn’t depend on them even if you wanted to.
 *
 *   The Prototype pattern provides the client code with a general interface for
 *   working with all objects that support cloning. This interface makes the
 *   client code independent from the concrete classes of objects that it clones.
 *
 * * Use the pattern when you want to reduce the number of subclasses that only
 *   differ in the way they initialize their respective objects. Somebody could
 *   have created these subclasses to be able to create objects with a specific
 *   configuration.
 *
 *   The Prototype pattern lets you use a set of pre-built objects, configured
 *   in various ways, as prototypes.
 *
 *
 * ## NOTE:
 *    Dart doesn't have prototypes or prototypal inheritance, and instead uses
 *    classical inheritance. Rather than a prototype, objects have a class, and
 *    instead of a prototype chain, objects have an super classes.
 *
 *
 * ## Implementation steps:
 *
 * (1) Create the prototype interface and declare the [clone()] method in it.
 */
abstract class Prototype {
  String color;

  Prototype clone();
}

class Circle implements Prototype {
  String color;
  double radius;
  bool isClone = false;

  Circle({this.radius = 30, this.color = "White"});

  /**
   * (2) A prototype class must define the alternative constructor that accepts
   *     an object of that class as an argument. The constructor must copy the
   *     values of all fields defined in the class from the passed object into
   *     the newly created instance.
   */
  Circle.createClone(Circle circle) {
    radius = circle.radius;
    color = circle.color;
    isClone = true;
  }

  /**
   * Optional getter to determine where is the copy and where is the original
   * object
   */
  String get cloneStatus => isClone ? "a clone shape" : "an original shape";

  /**
   * (3) The cloning method usually consists of just one line: calling the
   *     prototype constructor.
   */
  @override
  Circle clone() => Circle.createClone(this);
}
