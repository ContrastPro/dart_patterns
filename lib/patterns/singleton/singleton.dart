void main() {
  _customSingleton();
  _dartSingleton();
  _smallSingleton();
}

void _customSingleton() {
  final s1 = CustomSingleton.getInstance('First Object of Custom Singleton');
  final s2 = CustomSingleton.getInstance('Second Object of Custom Singleton');
  print(s1.customSingletonValue);
  print(s2.customSingletonValue);
  print("Object is identical: ${identical(s1, s2)}\n");
}

void _dartSingleton() {
  final s1 = DartSingleton('First Object of Dart Singleton');
  final s2 = DartSingleton('Second Object of Dart Singleton');
  print(s1.dartSingletonValue);
  print(s2.dartSingletonValue);
  print("Object is identical: ${identical(s1, s2)}\n");
}

void _smallSingleton() {
  final s1 = SmallSingleton('First Object of Small Singleton');
  final s2 = SmallSingleton('Second Object of Small Singleton');
  print(s1.smallSingletonValue);
  print(s2.smallSingletonValue);
  print("Object is identical: ${identical(s1, s2)}");
}

class CustomSingleton {
  static CustomSingleton _customSingleton;
  String customSingletonValue;

  static CustomSingleton getInstance(String value) {
    if (_customSingleton == null) {
      _customSingleton = CustomSingleton._(value);
    }
    return _customSingleton;
  }

  CustomSingleton._(this.customSingletonValue) {
    print("Lazy initialization (first initialization) do something....");
  }
}

class DartSingleton {
  static DartSingleton _dartSingleton;
  String dartSingletonValue;

  factory DartSingleton(String value) {
    if (_dartSingleton == null) {
      _dartSingleton = DartSingleton._(value);
    }
    return _dartSingleton;
  }

  DartSingleton._(this.dartSingletonValue) {
    print("Lazy initialization (first initialization) do something....");
  }
}

class SmallSingleton {
  static SmallSingleton _smallSingleton;
  String smallSingletonValue;

  SmallSingleton._(String value) {
    print("Lazy initialization (first initialization) do something....");
    _smallSingleton = this;
    smallSingletonValue = value;
  }

  factory SmallSingleton(String value) =>
      _smallSingleton ?? SmallSingleton._(value);
}
