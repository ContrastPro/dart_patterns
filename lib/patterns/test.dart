void main() {
  Singleton s1 = Singleton.getInstance();
  Singleton s2 = Singleton.getInstance();

  print(s1.hashCode);
  print(s2.hashCode);
}

// Custom S
class Singleton {
  static Singleton _singleton;

  Singleton._();

  static Singleton getInstance() {
    if (_singleton == null) {
      _singleton = Singleton._();
    }
    return _singleton;
  }
}


// Dart S
class SmallSingleton {
  static SmallSingleton _smallSingleton;

  SmallSingleton._() {
    _smallSingleton = this;
  }

  factory SmallSingleton(String value) => _smallSingleton ?? SmallSingleton._();
}
