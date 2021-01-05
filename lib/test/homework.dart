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

  /*final List list = [1, 2, 3, 4];

  for (int i = 0; i < list.length; ++i) {
    for (int j = i + 1; j < list.length; ++j) {
      print("${list[i]} == ${list[j]} ${identical(list[i], list[j])}");
    }
  }*/
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
