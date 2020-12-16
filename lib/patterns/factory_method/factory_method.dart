/**
 *
 * ## The essence of the pattern.
 *
 * * A factory method is an creational pattern that defines a common interface for
 *   creating objects in a superclass, allowing subclasses to change the type of objects
 *   they create.
 *
 *
 * ## Applicability.
 *
 * * When you don't know in advance the types and dependencies of the objects your code
 *   should work with.
 *
 *   The factory method separates the production code of products from the rest of the
 *   code that the products use.
 *
 *   Thanks to this, the production code can be extended without touching the main one.
 *   So, to add support for a new product, you need to create a new subclass and define a
 *   factory method in it, returning an instance of the new product from there.
 *
 * * When you want to conserve system resources by reusing already created objects instead
 *   of spawning new ones.
 *
 *   This problem usually occurs when working with heavy resource-intensive objects,
 *   such as connecting to a database, file system, etc. Imagine how many actions
 *   you need to take to reuse existing objects
 *
 *
 * ## Implementation steps:
 *
 * (1) Bring all the products you create to a common interface.
 */
abstract class Button {
  FactoryMethod factoryMethod;
  String currentPlatform;
}

class FactoryMethod {
  final double width;
  final double height;
  final String color;

  FactoryMethod(this.width, this.height, this.color);

  /**
   * (2) In the class that produces products, create an empty factory method.
   * Specify the generic product interface as the return type.
   */
  @override
  String toString();
}

class WindowsButton extends Button {
  final FactoryMethod factoryMethod;

  /**
   * (3) Then go through the class code and find all the areas that create products.
   * Alternately replace these sections with calls to the factory method, transferring
   * the code for creating various products into it.
   */
  WindowsButton({double width, double height, String color})
      : factoryMethod = FactoryMethod(width, height, color);

  /**
   * (4) For each product type, create a subclass and override the factory method in it.
   * Move the code to create the corresponding product from the superclass there.
   */
  @override
  String toString() =>
      "FAB for $currentPlatform, Color: ${factoryMethod.color}";
}

class IOSButton extends Button {
  final FactoryMethod factoryMethod;

  IOSButton({double width, double height, String color})
      : factoryMethod = FactoryMethod(width, height, color);

  @override
  String toString() =>
      "FAB for $currentPlatform, Color: ${factoryMethod.color}";
}

class LinuxButton extends Button {
  final FactoryMethod factoryMethod;

  LinuxButton({double width, double height, String color})
      : factoryMethod = FactoryMethod(width, height, color);

  @override
  String toString() =>
      "FAB for $currentPlatform, Color: ${factoryMethod.color}";
}

enum OperationSystem { windows, ios, linux }

class FloatingActionButton {
  static Button extended(OperationSystem operationSystem) {
    Button button;
    switch (operationSystem) {
      case OperationSystem.windows:
        button = WindowsButton(width: 10, height: 20, color: "Blue");
        button.currentPlatform = "Windows";
        break;
      case OperationSystem.ios:
        button = IOSButton(width: 20, height: 30, color: "White");
        button.currentPlatform = "IOS";
        break;
      case OperationSystem.linux:
        button = LinuxButton(width: 30, height: 40, color: "Black");
        button.currentPlatform = "Linux";
        break;
      default:
        button = WindowsButton(width: 10, height: 20, color: "Blue");
        button.currentPlatform = "Windows";
    }
    return button;
  }
}
