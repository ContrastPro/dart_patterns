import 'test_class.dart';

class Test {
  static void customTest() {
    final singleton1 = Singleton();
    final singleton2 = Singleton();

    print(singleton1 == singleton2);
  }
}
