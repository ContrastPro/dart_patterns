/**
 *
 * ## The essence of the pattern.
 *
 * * The abstract factory pattern provides a way to encapsulate a group of
 *   individual factories that have a common theme without specifying their concrete
 *   classes. In normal usage, the client software creates a concrete implementation of
 *   the abstract factory and then uses the generic interface of the factory to create
 *   the concrete objects that are part of the theme.
 *
 *
 * ## Applicability.
 *
 * * When the business logic of the program must work with different kinds of related
 *   products, regardless of specific classes of products.
 *
 *   An abstract factory hides from the client code the details of how and what
 *   specific objects will be created. But at the same time, the client code can work
 *   with all types of products created, since their common interface was predefined.
 *
 * * When the [FactoryMethod] is already used in the program, but the next changes
 *   involve the introduction of new types of products.
 *
 *   In a good program, each class is responsible for only one thing. If a class has
 *   too many factory methods, they can obscure its main function. Therefore, it makes
 *   sense to move all the logic for creating products into a separate class hierarchy
 *   using an abstract factory.
 *
 *
 * ## Implementation steps:
 *
 * (1) Create a table of relationships between product types and product family variations.
 *
 * The pattern assumes that you have multiple product families,located in separate class
 * hierarchies (Button / Checkbox ets.). Products of one families must have a common interface.
 *
 * This is a common interface for the [Button] product family.
 */
abstract class Button {
  void paint();
}

/**
 * (2) Bring all product variations to common interfaces.
 *
 * All product families have the same variations (IOS / Windows).
 *
 * This is a Windows variant of the button.
 */
class WindowsButton implements Button {
  void paint() {
    print("You have created Windows Button");
  }
}

/**
 * All product families have the same variations (IOS / Windows).
 *
 * This is a IOS variant of the button.
 */
class IOSButton implements Button {
  void paint() {
    print("You have created IOS Button");
  }
}

/**
 * (3) Define an abstract factory interface. It must have factory methods to create
 * each of the product types.
 *
 * An [AbstractFactory] knows about all (abstract) product types.
 */
abstract class AbstractFactory {
  Button createButton();
}

/**
 * (4) Create concrete factory classes by implementing the abstract factory interface.
 * There should be as many of these classes as there are variations of product families.
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
