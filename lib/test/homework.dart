void main() {
  final singleton = ListVew()
    ..addItem(Singleton())
    ..addItem(Singleton())
    ..addItem(Singleton())
    ..addItem(Singleton());

  for (int i = 0; i < singleton.listSingleton.length; ++i) {
    for (int j = i + 1; j < singleton.listSingleton.length; ++j) {
      print(identical(singleton.listSingleton[i], singleton.listSingleton[j]));
    }
  }
}

class Singleton {
  static Singleton _singleton;

  Singleton._() {
    _singleton = this;
  }

  factory Singleton() => _singleton ?? Singleton._();
}

class ListVew implements Singleton {
  List<Singleton> listSingleton = [];

  addItem(Singleton singleton) => listSingleton.add(singleton);
}
