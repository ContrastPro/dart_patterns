/**
 *
 * ## The essence of the pattern.
 *
 * * Abstract Factory is a creational design pattern that lets you produce
 *   families of related objects without specifying their concrete classes.
 *
 *
 * ## Applicability.
 *
 * * Use the Abstract Factory when your code needs to work with various families
 *   of related products, but you don’t want it to depend on the concrete
 *   classes of those products—they might be unknown beforehand or you simply
 *   want to allow for future extensibility.
 *
 * * When the [FactoryMethod] is already used in the program, but the next
 *   changes involve the introduction of new types of products.
 *
 *   In a good program, each class is responsible for only one thing. If a class
 *   has too many factory methods, they can obscure its main function.
 *   Therefore, it makes sense to move all the logic for creating products into
 *   a separate class hierarchy using an abstract factory.
 *
 *
 * ## Implementation steps:
 *
 * (1) Declare abstract product interfaces for all product types. Then make all
 *     concrete product classes implement these interfaces.
 *
 * The pattern assumes that you have multiple product families,located in
 * separate class hierarchies (Button / Checkbox ets.). Products of one
 * families must have a common interface.
 *
 * This is a common interface for the [Button] product family.
 */
abstract class Button {
  void paint();
}

/**
 * (2) Bring all product variations to common interfaces.
 *
 * All product families have the same variations (IOS / Windows). This is a
 * Windows variant of the button.
 */
class WindowsButton implements Button {
  void paint() {
    print("You have created Windows Button");
  }
}

/**
 * All product families have the same variations (IOS / Windows). This is an
 * IOS variant of the button.
 */
class IOSButton implements Button {
  void paint() {
    print("You have created IOS Button");
  }
}

/**
 * (3) Declare the abstract factory interface with a set of creation methods
 *     for all abstract products.
 *
 * An [AbstractFactory] knows about all (abstract) product types.
 */
abstract class AbstractFactory {
  Button createButton();
}

/**
 * (4) Implement a set of concrete factory classes, one for each product variant.
 *     There should be as many of these classes as there are variations of
 *     product families.
 *
 * Each specific factory knows and creates only the products of its variation.
 */
class WindowsFactory implements AbstractFactory {
  Button createButton() {
    return WindowsButton();
  }
}

/**
 * Each specific factory knows and creates only the products of its variation.
 */
class IOSFactory implements AbstractFactory {
  Button createButton() {
    return IOSButton();
  }
}

/**
 * The application chooses the type and creates specific factories dynamically
 * based on the configuration or environment.
 */
class ApplicationStyle {
  AbstractFactory _abstractFactory;
  Button _button;

  void configureStyle(String currentSystem) {
    switch (currentSystem.toLowerCase()) {
      case "windows":
        _abstractFactory = WindowsFactory();
        break;
      case "ios":
        _abstractFactory = IOSFactory();
        break;
      default:
        print("I only have two moods...");
    }
    _createStyle();
  }

  void _createStyle() {
    _button = _abstractFactory.createButton();
    _button.paint();
  }
}
