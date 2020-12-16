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
     * Директор получает объект конкретного строителя от клиента
     * (приложения). Приложение само знает какой строитель использовать,
     * чтобы получить нужный продукт.
     */
    final director = Director();
    final carBuilder = CarBuilder();
    director.constructSportsCar(carBuilder);

    /**
     * Готовый продукт возвращает строитель, так как Директор чаще всего не
     * знает и не зависит от конкретных классов строителей и продуктов.
     */
    final car = carBuilder.build();
    print("Car built: ${car.getCarType()}\n");

    /**
     * Директор может знать больше одного рецепта строительства.
     */
    final manualBuilder = ManualBuilder();
    director.constructSportsCar(manualBuilder);
    final carManual = manualBuilder.build();
    print(carManual.printManualInfo());
  }
}
