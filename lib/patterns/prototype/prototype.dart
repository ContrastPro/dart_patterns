/**
 *
 * ## The essence of the pattern.
 *
 * * Prototype is a generative design pattern that allows objects to be copied
 *   without going into the details of their implementation.
 *
 *
 * ## Analogy from life.
 *
 * * In industrial production, prototypes are created before the main batch of products
 *   for all kinds of tests. At the same time, the prototype does not participate in
 *   subsequent production, playing a passive role.
 *
 * * A prototype in production does not make a copy of itself, so a closer example of a
 *   pattern is cell division. After mitotic cell division, two completely identical
 *   cells are formed. The original cell plays the role of a prototype, taking an active
 *   part in the creation of a new object.
 *
 *
 * ## Applicability.
 *
 * * When your code should not depend on the classes of the objects being copied.
 *   This is often the case if your code is working with objects served externally
 *   through some common interface. You cannot bind to their classes even if you
 *   wanted to, since their specific classes are unknown.
 *
 *   The prototype pattern provides the client with a common interface for working
 *   with all prototypes. The client does not need to depend on all the classes of the
 *   copied objects, but only on the cloning interface.
 *
 * * When you have a bunch of subclasses that differ in initial field values.
 *   Someone could have created all of these classes to be able to easily spawn objects
 *   with a specific configuration.
 *
 *   The prototype attribute suggests using a set of prototypes instead of subclassing to
 *   describe popular object configurations. Thus, instead of subclassing objects,
 *   you will copy existing prototype objects that already have internal state set up.
 *   This will avoid an explosive growth in the number of classes in the program and
 *   reduce its complexity.
 *
 * ## NOTE:
 *    Dart doesn't have prototypes or prototypal inheritance, and instead uses classical
 *    inheritance. Rather than a prototype, objects have a class, and instead of a
 *    prototype chain, objects have an super classes.
 *
 *
 * ## Implementation steps:
 *
 * (1) Create a prototype interface with a single [clone()] method.
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
   * (2) Add a named constructor to future prototype classes that takes an object
   * of the current class as an argument. This constructor should copy from the
   * supplied object the values of all fields declared within the current class
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
   * prototype constructor.
   */
  @override
  Circle clone() => Circle.createClone(this);
}
