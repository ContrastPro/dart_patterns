import 'dart:io';
import 'run_methods/run_methods.dart';

void main() => _runApp();

void _runApp() {
  AllMethods allMethods = AllMethods();

  int index;
  do {
    print('\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
    print("Enter number:");
    index = int.parse(stdin.readLineSync());
    switch (index) {
      case 1:
        allMethods = AllMethods(
          patternClass: 'Generative patterns',
          patternName: 'Custom Singleton',
        );
        allMethods.customSingleton();
        break;
      case 2:
        allMethods = AllMethods(
          patternClass: 'Generative patterns',
          patternName: 'Dart Singleton',
        );
        allMethods.dartSingleton();
        break;
    }
  } while (index != 0);
}
