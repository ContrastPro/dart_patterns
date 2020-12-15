import '../classes/singleton.dart';

class AllMethods {
  final String patternClass;
  final String patternName;

  AllMethods({this.patternClass, this.patternName});

  void _printPatternInfo() => print('# $patternClass -> $patternName #');

  void customSingleton() {
    _printPatternInfo();
    /**
     * (5) In the client code, replace calls to the singleton constructor with calls
     * to its constructor method.
     *
     * * No other code will replace the instantiated class
     */
    final singleton1 =
        CustomSingleton.getInstance('First created Object of $patternName');
    final singleton2 =
        CustomSingleton.getInstance('Second created Object of $patternName');
    print(singleton1.customSingletonValue);
    print(singleton2.customSingletonValue);
    print("Object is identical: ${identical(singleton1, singleton2)}");
  }

  void dartSingleton() {
    _printPatternInfo();
    final singleton1 = DartSingleton('First created Object of $patternName');
    final singleton2 = DartSingleton('Second created Object of $patternName');
    print(singleton1.dartSingletonValue);
    print(singleton2.dartSingletonValue);
    print("Object is identical: ${identical(singleton1, singleton2)}");
  }
}
