void main() {
  _customSingleton();
  _dartSingleton();
}

void _customSingleton() {
  final singleton1 =
      CustomSingleton.getInstance('First created Object of Custom Singleton');
  final singleton2 =
      CustomSingleton.getInstance('Second created Object of Custom Singleton');
  print(singleton1.customSingletonValue);
  print(singleton2.customSingletonValue);
  print("Object is identical: ${identical(singleton1, singleton2)}\n");
}

void _dartSingleton() {
  final singleton1 = DartSingleton('First created Object of Dart Singleton');
  final singleton2 = DartSingleton('Second created Object of Dart Singleton');
  print(singleton1.dartSingletonValue);
  print(singleton2.dartSingletonValue);
  print("Object is identical: ${identical(singleton1, singleton2)}");
}

// ## Case (1) create [CustomSingleton]. Standard solution for OOP languages.

class CustomSingleton {
  static CustomSingleton _customSingleton;
  String customSingletonValue;

  static CustomSingleton getInstance(String value) {
    if (_customSingleton == null) {
      _customSingleton = CustomSingleton._(customSingletonValue: value);
    }
    return _customSingleton;
  }

  CustomSingleton._({this.customSingletonValue}) {
    print("Lazy initialization (first initialization) do something....");
  }
}

// ## Case (2) create [DartSingleton]. Solution for Dart language.

class DartSingleton {
  static DartSingleton _dartSingleton;
  String dartSingletonValue;

  factory DartSingleton(String value) {
    if (_dartSingleton == null) {
      _dartSingleton = DartSingleton._(dartSingletonValue: value);
    }
    return _dartSingleton;
  }

  DartSingleton._({this.dartSingletonValue}) {
    print("Lazy initialization (first initialization) do something....");
  }
}