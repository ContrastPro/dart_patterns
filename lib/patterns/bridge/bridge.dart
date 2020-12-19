/**
 *
 * ## The essence of the pattern.
 *
 * * Bridge is a structural design pattern that lets you split a large class or
 *   a set of closely related classes into two separate hierarchies—abstraction
 *   and implementation—which can be developed independently of each other.
 *
 *
 * ## Abstraction and Implementation
 *
 * * Abstraction (also called interface) is a high-level control layer for some
 *   entity. This layer isn’t supposed to do any real work on its own. It should
 *   delegate the work to the implementation layer (also called platform).
 *
 *
 * ## Analogy from life.
 *
 * * When talking about real applications, the abstraction can be represented
 *   by a graphical user interface (GUI), and the implementation could be the
 *   underlying operating system code (API) which the GUI layer calls in
 *   response to user interactions.
 *
 *
 * ## Applicability.
 *
 * * Use the Bridge pattern when you want to divide and organize a monolithic
 *   class that has several variants of some functionality (for example, if the
 *   class can work with various database servers).
 *
 *   The bigger a class becomes, the harder it is to figure out how it works,
 *   and the longer it takes to make a change. The changes made to one of the
 *   variations of functionality may require making changes across the whole
 *   class, which often results in making errors or not addressing some critical
 *   side effects.
 *
 * * When a class needs to be extended in two independent planes.
 *
 *   The bridge suggests separating one of these planes into a separate class
 *   hierarchy, keeping a link to one of its objects in the original class.
 *
 *
 * ## Implementation steps:
 *
 * (1) Identify the orthogonal dimensions in your classes. These independent
 *     concepts could be: abstraction/platform, domain/infrastructure,
 *     front-end/back-end, or interface/implementation.
 *
 * (2) Abstraction.
 *     See what operations the client needs and define them in the base
 *     abstraction class.
 */
abstract class Framework {
  FlutterSDK flutterSDK;

  void runApp();
}

/**
 * (3) Implementation.
 *     Determine the operations available on all platforms. Declare the ones
 *     that the abstraction needs in the general implementation interface.
 *     Based on this, describe a common implementation interface.
 */
abstract class FlutterSDK {
  void buildApp();
}

/**
 * (4) For all platforms in your domain create concrete implementation classes,
 *     but make sure they all follow the implementation interface.
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
   * (5) Inside the abstraction class, add a reference field for the
   *     implementation type. The abstraction delegates most of the work to
   *     the implementation object that’s referenced in that field.
   */
  FlutterSDK flutterSDK;

  /**
   * (6) The client code should pass an implementation object to the
   *     abstraction’s constructor to associate one with the other. After that,
   *     the client can forget about the implementation and work only with the
   *     abstraction object.
   */
  FlutterEngine({this.flutterSDK});

  @override
  void runApp() {
    this.flutterSDK.buildApp();
  }
}
