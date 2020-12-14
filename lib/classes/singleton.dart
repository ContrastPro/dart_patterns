/**
 * ## The essence of the pattern.
 *
 * Singleton guarantees the existence of only one object of a certain class, and
 * also allows to reach this object from anywhere in the program.
 *
 * All singleton implementations boil down to hiding the default constructor and
 * creating a public static method that will control the lifecycle of the singleton
 * object.
 *
 * If you have access to the singleton class, then you will have access to this
 * static method as well. From whatever point in the code you call it, it will
 * always return the same object.
 *
 *
 * ## Analogy from life.
 *
 * The government of the state is a good example of a loner. There can be only one
 * official government in a state. Regardless of who exactly sits in the government,
 * it has a global access point "Government of country N".
 *
 *
 * ## Applicability.
 *
 * When the program should have a single instance of a class available to all clients
 * (for example, shared access to a database from different parts of the program).
 *
 * A singleton hides from clients all methods of creating a new object, except for a
 * special method. This method either creates an object, or gives an existing object
 * if it has already been created.
 *
 *
 * ## Implementation steps:
 */
class Singleton {
  /**
   * 1) Add a private static field to the class that will contain a single object.
   *
   * * The static keyword is used for a class-level variable and method that is
   *   the same for every instance of a class, this means if a data member is static,
   *   it can be accessed without creating an object.
   */
  static Singleton _instance;
  String singletonValue;

  /**
   * 2) Declare a static constructor method to be used to get the singleton.
   */
  static Singleton getInstance(String value) {
    /**
     * 3) Add "lazy initialization" (object creation the first time the method is
     * called) to the creating singleton method.
     */
    if (_instance == null) {
      _instance = Singleton._(value);
    }
    return _instance;
  }

  /**
   * 4) Make the constructor of the class private.
   *
   * * Class constructor [Singleton._()] will be accessible only from its class.
   *   However, you can call the private constructor in the same file.
   */
  Singleton._(String value) {
    print("First initialization (lazy initialization) do something....");
    this.singletonValue = value;
  }
}