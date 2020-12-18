/**
 *
 * ## The essence of the pattern.
 *
 * * A bridge is a structural design pattern that separates one or more classes into two
 *   separate hierarchies - abstraction and implementation, allowing them to be modified
 *   independently of each other.
 *
 *
 * ## Abstraction and Implementation
 *
 * * Abstraction (or interface) is a figurative layer of control over something.
 *   It does not do the work on its own, but delegates it to the implementation
 *   layer (sometimes called the platform).
 *
 *
 * ## Analogy from life.
 *
 * * If we talk about real programs, then the abstraction can be the graphical interface
 *   of the program (GUI), and the implementation can be the low-level code
 *   of the operating system (API), which the graphical interface refers to in response
 *   to user actions.
 *
 *
 * ## Applicability.
 *
 * * When you want to split up a monolithic class that contains several different
 *   implementations of some functionality (for example, if the class can work with
 *   different database systems).
 *
 *   The larger the class, the harder it is to understand its code, and the more it
 *   delays development. The bridge allows you to split a monolithic class into several
 *   separate hierarchies. After that, you can change their code independently of each other.
 *   This makes it easier to work on the code and reduces the likelihood of introducing errors.
 *
 * * When a class needs to be extended in two independent planes.
 *
 *   The bridge suggests separating one of these planes into a separate class hierarchy,
 *   keeping a link to one of its objects in the original class.
 *
 *
 * ## Implementation steps:
 *
 * (1) Determine if there are two disjoint dimensions in your classes. It can be
 *     functionality / platform, domain / infrastructure, front-end / back-end,
 *     or interface / implementation.
 *
 * (2) Abstraction.
 *     Consider what operations your clients will need and describe them in a base
 *     abstraction class.
 */
abstract class Framework {
  FlutterSDK flutterSDK;

  void runApp();
}

/**
 * (3) Implementation.
 *     Define the behaviors that are available on all platforms and isolate the part
 *     that needs the abstraction. Based on this, describe a common implementation
 *     interface.
 */
abstract class FlutterSDK {
  void buildApp();
}

/**
 * (4) For each platform, create your own implementation-specific class. They all
 *     need to follow the common interface that we outlined before.
 */
class FlutterWindows extends FlutterSDK {
  @override
  void buildApp() {
    print("Flutter app build for Windows");
  }
}

class FlutterIOS extends FlutterSDK {
  @override
  void buildApp() {
    print("Flutter app build for IOS");
  }
}

class FlutterWEB extends FlutterSDK {
  @override
  void buildApp() {
    print("Flutter app build for WEB");
  }
}

class FlutterEngine extends Framework {
  /**
   * (5) Add a reference to the implementation object to the abstraction class.
   *     Implement abstraction methods by delegating the main work to a related
   *     implementation object.
   */
  FlutterSDK flutterSDK;

  /**
   * (6) The client must feed the implementation object to the abstraction constructor
   *     to tie them together. After that, he can freely use the abstraction object, forgetting
   *     about the implementation.
   */
  FlutterEngine({this.flutterSDK});

  @override
  void runApp() {
    this.flutterSDK.buildApp();
  }
}
