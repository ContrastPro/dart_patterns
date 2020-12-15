import '../patterns/prototype/prototype.dart';
import '../patterns/singleton/singleton.dart';

class AllMethods {
  final String patternClass;
  final String patternName;

  AllMethods({this.patternClass, this.patternName});

  /**
   * Print information about chosen pattern
   */
  void _printPatternInfo() => print('# $patternClass -> $patternName #');

  /**
   * ## [CustomSingleton]
   */
  void customSingleton() {
    _printPatternInfo();
    final singleton1 =
        CustomSingleton.getInstance('First created Object of $patternName');
    final singleton2 =
        CustomSingleton.getInstance('Second created Object of $patternName');
    print(singleton1.customSingletonValue);
    print(singleton2.customSingletonValue);
    print("Object is identical: ${identical(singleton1, singleton2)}");
  }

  /**
   * ## [DartSingleton]
   */
  void dartSingleton() {
    _printPatternInfo();
    final singleton1 = DartSingleton('First created Object of $patternName');
    final singleton2 = DartSingleton('Second created Object of $patternName');
    print(singleton1.dartSingletonValue);
    print(singleton2.dartSingletonValue);
    print("Object is identical: ${identical(singleton1, singleton2)}");
  }

  /**
   * ## [Prototype]
   */
  void dartPrototype() {
    _printPatternInfo();
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
}
