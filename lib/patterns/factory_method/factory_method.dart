/**
 *
 * ## The essence of the pattern.
 *
 * * Factory Method is a creational design pattern that provides an interface
 *   for creating objects in a superclass, but allows subclasses to alter the
 *   type of objects that will be created.
 *
 *
 * ## Applicability.
 *
 * * Use the Factory Method when you don’t know beforehand the exact types and
 *   dependencies of the objects your code should work with.
 *
 *   The Factory Method separates product construction code from the code that
 *   actually uses the product. Therefore it’s easier to extend the product
 *   construction code independently from the rest of the code.
 *
 *   For example, to add a new product type to the app, you’ll only need to
 *   create a new creator subclass and override the factory method in it.
 *
 * * Use the Factory Method when you want to save system resources by reusing
 *   existing objects instead of rebuilding them each time.
 *
 *   You often experience this need when dealing with large, resource-intensive
 *   objects such as database connections, file systems, and network resources.
 *
 *
 * ## Implementation steps:
 *
 * (1) Make all products follow the same interface. This interface should
 *     declare methods that make sense in every product.
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
   * (2) Add an empty factory method inside the creator class. The return type
   *     of the method should match the common product interface.
   */
  @override
  String toString();
}

class WindowsButton extends Button {
  final FactoryMethod factoryMethod;

  /**
   * (3) In the creator’s code find all references to product constructors.
   *     One by one, replace them with calls to the factory method, while
   *     extracting the product creation code into the factory method.
   */
  WindowsButton({double width, double height, String color})
      : factoryMethod = FactoryMethod(width, height, color);

  /**
   * (4) Now, create a set of creator subclasses for each type of product listed
   *     in the factory method. Override the factory method in the subclasses and
   *     extract the appropriate bits of construction code from the base method.
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
