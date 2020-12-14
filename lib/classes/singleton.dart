/**
 * Singleton guarantees the existence of only one object of a certain class,
 * and also allows to reach this object from anywhere in the program.
 */

class Singleton {
  /**
   * The static keyword is used for a class-level variable and method that is
   * the same for every instance of a class, this means if a data member is static,
   * it can be accessed without creating an object.
   */

  static Singleton _instance;
  String value;

  /// Class constructor [Singleton] will be accessible only from its class

  Singleton._(String value) {
    /// Do something....

    this.value = value;
  }

  static Singleton getInstance(String value) {
    /// No other code will replace the instantiated class

    if (_instance == null) {
      _instance = Singleton._(value);
    }
    return _instance;
  }
}
