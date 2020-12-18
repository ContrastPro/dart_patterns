/**
 *
 * ## The essence of the pattern.
 *
 * * A facade is a structural design pattern that provides a simple interface to a
 *   complex class system, library, or framework.
 *
 *
 * ## Analogy from life.
 *
 * * When you call a store and place an order over the phone, a customer support person
 *   is your front to all services and departments of the store. It provides you with a
 *   simplified interface to the order creation system, payment system and shipping department.
 *
 *
 * ## Applicability.
 *
 * * When you need to present a simple interface to a complex subsystem.
 *
 *   Subsystems often become more complex as the program develops. Applying most patterns
 *   results in smaller classes, but in larger numbers. It is easier to reuse such a subsystem,
 *   adjusting it each time for specific needs, but at the same time, it becomes more difficult
 *   to use the subsystem without tuning. The façade offers a certain default system view that
 *   suits most clients.
 *
 * * When you want to decompose a subsystem into separate layers.
 *
 *   Use facades to define entry points for each level of the subsystem.
 *   If subsystems depend on each other, then the dependency can be simplified by allowing
 *   subsystems to exchange information only through facades.
 *
 * ## Implementation steps:
 *
 * (1) Determine if you can create a simpler interface than the complex subsystem provides.
 *     You are on the right track if this interface saves the client from having to know about
 *     the details of the subsystem.
 *
 * (2) Create a facade class that implements this interface. It should forward client calls
 *     to the desired subsystem objects. The facade will have to take care to properly initialize
 *     the subsystem objects.
 */
class PC {
  final _motherboard = Motherboard();
  final _hardDrive = HardDrive();
  final _graphicsCard = GraphicsCard();

  /**
   * (3) You will get maximum benefit if the client only works with the facade. In this case,
   *     changes to the subsystem will affect only the facade code, and the client code will remain
   *     working.
   */
  void turnOn() {
    print("\nPC turned ON\n\n");
    _motherboard.motherboardOn();
    _hardDrive.hardOn();
    _graphicsCard.cardOn();
  }

  void turnOff() {
    print("\nPC turned OFF\n\n");
    _motherboard.motherboardOff();
    _hardDrive.hardOff();
    _graphicsCard.cardOff();
  }
}

/**
 * Subsystem #1
 */
class Motherboard {
  void motherboardOn() =>
      print("The motherboard is ON and has started the hard drive");

  void motherboardOff() =>
      print("The motherboard is OFF and the hard drive has stopped");
}
/**
 * Subsystem #2
 */
class HardDrive {
  void hardOn() => print("The hard disk boots the operation system");

  void hardOff() => print("Hard disk shutdown");
}
/**
 * Subsystem #3
 */
class GraphicsCard {
  void cardOn() => print("The video card displays the image on the screen");

  void cardOff() => print("Video card is off");
}
