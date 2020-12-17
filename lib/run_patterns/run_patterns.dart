import '../patterns/abstract_factory/abstract_factory.dart';
import '../patterns/adapter/adapter.dart';
import '../patterns/bridge/bridge.dart';
import '../patterns/builder/builder.dart';
import '../patterns/factory_method/factory_method.dart';
import '../patterns/prototype/prototype.dart';
import '../patterns/singleton/singleton.dart';

class Pattern {
  /**
   * ## [CustomSingleton]
   */
  static void customSingleton() {
    final singleton1 =
        CustomSingleton.getInstance('First created Object of Custom Singleton');
    final singleton2 = CustomSingleton.getInstance(
        'Second created Object of Custom Singleton');
    print(singleton1.customSingletonValue);
    print(singleton2.customSingletonValue);
    print("Object is identical: ${identical(singleton1, singleton2)}");
  }

  /**
   * ## [DartSingleton]
   */
  static void dartSingleton() {
    final singleton1 = DartSingleton('First created Object of Dart Singleton');
    final singleton2 = DartSingleton('Second created Object of Dart Singleton');
    print(singleton1.dartSingletonValue);
    print(singleton2.dartSingletonValue);
    print("Object is identical: ${identical(singleton1, singleton2)}");
  }

  /**
   * ## [Prototype]
   */
  static void dartPrototype() {
    final originalCircle = Circle(radius: 11, color: "Black");
    final cloneCircle = originalCircle.clone();
    final someOtherCircle = Circle(radius: 55, color: "White");

    print(
      "Original circle is: ${originalCircle.cloneStatus},"
      "\nColor: ${originalCircle.color}"
      "\nRadius: ${originalCircle.radius}\n",
    );
    print(
      "Clone circle is: ${cloneCircle.cloneStatus},"
      "\nColor: ${cloneCircle.color}"
      "\nRadius: ${cloneCircle.radius}\n",
    );
    print(
      "Some other circle is: ${someOtherCircle.cloneStatus},"
      "\nColor: ${someOtherCircle.color}"
      "\nRadius: ${someOtherCircle.radius}\n",
    );
  }

  /**
   * ## [FactoryMethod]
   */
  static void dartFactoryMethod() {
    final windowsButton =
        FloatingActionButton.extended(OperationSystem.windows);
    final iosButton = FloatingActionButton.extended(OperationSystem.ios);
    final linuxButton = FloatingActionButton.extended(OperationSystem.linux);

    print("Created $windowsButton.");
    print("Created $iosButton.");
    print("Created $linuxButton.");
  }

  /**
   * ## [Builder]
   */
  static void dartBuilder() {
    /**
     * The Director receives a specific Builder object from the client (application).
     * The application itself knows which builder to use to get the desired product.
     */
    final director = Director();
    final carBuilder = CarBuilder();
    director.constructSportsCar(carBuilder);

    /**
     * The finished product is returned by the Builder, since the Director most often
     * does not know and does not depend on the specific classes of builders and products.
     */
    final car = carBuilder.build();
    print("Car built: ${car.getCarType()}\n");

    /**
     * The Director may know more than one building recipe.
     */
    final manualBuilder = ManualBuilder();
    director.constructSportsCar(manualBuilder);
    final carManual = manualBuilder.build();
    print(carManual.printManualInfo());
  }

  /**
   * ## [AbstractFactory]
   */
  static void dartAbstractFactory() {
    ApplicationStyle application = ApplicationStyle();
    application.configureStyle("IOS");
  }

  /**
   * ## [Adapter]
   */
  static void dartAdapter() {
    /**
     * Since both adapter classes are guaranteed to have the same interface as IPostsAPI,
     * we can type API variables as IPostsAPI.
     */
    final IPostsAPI apiMedium = MediumAdapter();
    final IPostsAPI apiHabr = HabrAdapter();

    final List<Post> posts = apiMedium.getPosts() + apiHabr.getPosts();
    for (int i = 0; i < posts.length; i++) {
      print("Title: ${posts[i].title}\nContent: ${posts[i].content}\n");
    }
  }

  /**
   * ## [Bridge]
   */
  static void dartBridge() {
    final flutterWindows = FlutterEngine(flutterSDK: FlutterWindows());
    flutterWindows.runApp();

    final flutterIOS = FlutterEngine(flutterSDK: FlutterIOS());
    flutterIOS.runApp();

    final flutterWEB = FlutterEngine(flutterSDK: FlutterWEB());
    flutterWEB.runApp();
  }
}
