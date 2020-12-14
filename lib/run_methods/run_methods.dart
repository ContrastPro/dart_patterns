import '../classes/singleton.dart';

void runSingleton() {
  print('~~~~~~~~~~\nGenerative patterns -> Singleton\n~~~~~~~~~~');
  /**
   * 5) In the client code, replace calls to the singleton constructor with calls
   * to its constructor method.
   *
   * * No other code will replace the instantiated class
   */
  final singleton1 = Singleton.getInstance('First created Object of Singleton');
  final singleton2 =
      Singleton.getInstance('Second created Object of Singleton');
  print(singleton1.singletonValue);
  print(singleton2.singletonValue);
}
