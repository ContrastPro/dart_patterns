/**
 *
 * ## The essence of the pattern.
 *
 * * Facade is a structural design pattern that provides a simplified interface
 *   to a library, a framework, or any other complex set of classes.
 *
 *
 * ## Analogy from life.
 *
 * * When you call a shop to place a phone order, an operator is your facade to
 *   all services and departments of the shop. The operator provides you with
 *   a simple voice interface to the ordering system, payment gateways, and
 *   various delivery services.
 *
 *
 * ## Applicability.
 *
 * *  Use the Facade pattern when you need to have a limited but straightforward
 *   interface to a complex subsystem.
 *
 *   Often, subsystems get more complex over time. Even applying design patterns
 *   typically leads to creating more classes. A subsystem may become more
 *   flexible and easier to reuse in various contexts, but the amount of
 *   configuration and boilerplate code it demands from a client grows ever
 *   larger.
 *
 *   The Facade attempts to fix this problem by providing a shortcut to the
 *   most-used features of the subsystem which fit most client requirements.
 *
 * * Use the Facade when you want to structure a subsystem into layers.
 *
 *   Create facades to define entry points to each level of a subsystem.
 *   You can reduce coupling between multiple subsystems by requiring them to
 *   communicate only through facades.
 *
 * ## Implementation steps:
 *
 * (1) Check whether it’s possible to provide a simpler interface than what an
 *     existing subsystem already provides. You’re on the right track if this
 *     interface makes the client code independent from many of the
 *     subsystem’s classes.
 *
 * (2) Declare and implement this interface in a new facade class.
 *     The facade should redirect the calls from the client code to appropriate
 *     objects of the subsystem. The facade should be responsible for
 *     initializing the subsystem and managing its further life cycle unless
 *     the client code already does this.
 */
class PC {
  final _motherboard = Motherboard();
  final _hardDrive = HardDrive();
  final _graphicsCard = GraphicsCard();

  /**
   * (3) To get the full benefit from the pattern, make all the client code
   *     communicate with the subsystem only via the facade. Now the client code
   *     is protected from any changes in the subsystem code. For example,
   *     when a subsystem gets upgraded to a new version, you will only need
   *     to modify the code in the facade.
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
