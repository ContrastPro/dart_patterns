/**
 *
 * ## The essence of the pattern.
 *
 * * Singleton is a creational design pattern that lets you ensure that a class
 *   has only one instance, while providing a global access point to this
 *   instance.
 *
 *   All singleton implementations boil down to hiding the default constructor
 *   and creating a public static method that will control the lifecycle of the
 *   singleton object.
 *
 * * If you have access to the singleton class, then you will have access to this
 *   static method as well. From whatever point in the code you call it, it will
 *   always return the same object.
 *
 *
 * ## Analogy from life.
 *
 * * The government is an excellent example of the Singleton pattern. A country
 *   can have only one official government. Regardless of the personal identities
 *   of the individuals who form governments, the title, “The Government of X”,
 *   is a global point of access that identifies the group of people in charge.
 *
 *
 * ## Applicability.
 *
 * * Use the Singleton pattern when a class in your program should have just a
 *   single instance available to all clients; for example, a single database
 *   object shared by different parts of the program.
 *
 *   The Singleton pattern disables all other means of creating objects of a
 *   class except for the special creation method. This method either creates a
 *   new object or returns an existing one if it has already been created.
 *
 *
 * ## Case (1) create [CustomSingleton].
 *
 * * Standard solution for OOP languages.
 *   Suitable for one-time initialization of object variables without the
 *   possibility of editing them in the future
 *
 *
 * ## Implementation steps:
 */
class CustomSingleton {
  /**
   *   (1) Add a private static field to the class for storing the singleton
   *       instance.
   *
   * * The static keyword is used for a class-level variable and method that is
   *   the same for every instance of a class, this means if a data member
   *   is static, it can be accessed without creating an object.
   */
  static CustomSingleton _customSingleton;
  String customSingletonValue;

  /**
   *  (2) Declare a public static creation method for getting the singleton
   *      instance.
   */
  static CustomSingleton getInstance(String value) {
    /**
     * (3) Implement “lazy initialization” inside the static method. It should
     *     create a new object on its first call and put it into the static
     *     field. The method should always return that instance on all
     *     subsequent calls.
     */
    if (_customSingleton == null) {
      _customSingleton = CustomSingleton._(customSingletonValue: value);
    }
    return _customSingleton;
  }

  /**
   *   (4) Make the constructor of the class private. The static method of the
   *       class will still be able to call the constructor, but not the other
   *       objects.
   *
   * * Class constructor [CustomSingleton._()] will be accessible only from its
   *   class. However, you can call the private constructor in the same file.
   */
  CustomSingleton._({this.customSingletonValue}) {
    print("Lazy initialization (first initialization) do something....");
  }
/**
 *   (5) Go over the client code and replace all direct calls to the singleton’s
 *       constructor with calls to its static creation method.
 *
 * * No other code will replace the instantiated class
 */
}

/**
 * ## Case (2) create [DartSingleton]. Solution for Dart language.
 */
class DartSingleton {
  /**
   *   (1) Add a private static field to the class for storing the singleton
   *       instance.
   */
  static DartSingleton _dartSingleton;
  String dartSingletonValue;

  /**
   * (2) Add factory constructor.
   *
   *     A factory constructor can be used in cases where the constructor
   *     doesn't always create a new instance of its class, as a standard
   *     constructor must.
   */
  factory DartSingleton(String value) {
    /**
     * (3) Implement "lazy initialization" (object creation the first time
     *     the method is called). It should create a new object on its first
     *     call and put it into the static field.
     */
    if (_dartSingleton == null) {
      _dartSingleton = DartSingleton._(dartSingletonValue: value);
    }
    return _dartSingleton;
  }

  /**
   *   (4) Make the constructor of the class private. The static method of the
   *       class will still be able to call the constructor, but not the other
   *       objects.
   *
   * * Class constructor [DartSingleton._()] will be accessible only from its
   *   class. However, you can call the private constructor in the same file.
   */
  DartSingleton._({this.dartSingletonValue}) {
    print("Lazy initialization (first initialization) do something....");
  }
}
