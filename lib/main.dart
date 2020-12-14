import 'classes/singleton.dart';

void main() => _runSingleton();

void _runSingleton() {
  print('Singleton -> Generative patterns');
  Singleton singleton1 = Singleton.getInstance('First Object of Singleton');
  Singleton singleton2 = Singleton.getInstance('Second Object of Singleton');
  print(singleton1.value);
  print(singleton2.value);
}
