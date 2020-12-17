import 'dart:io';
import 'run_patterns/run_patterns.dart';

void main() => runApp();

/**
 * Print information about chosen pattern
 */
void _printPatternInfo({String patternClass, String patternName}) {
  print('------------------------------------------------\n'
      '| # $patternClass -> $patternName # |'
      '\n------------------------------------------------');
}

void runApp() {
  int index;
  do {
    print('\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
    print("Enter number:");
    index = int.parse(stdin.readLineSync());
    switch (index) {
      /**
     * ## Creational patterns
     */
      case 1:
        _printPatternInfo(
          patternClass: 'Creational patterns',
          patternName: 'Custom Singleton',
        );
        Pattern.customSingleton();
        break;
      case 2:
        _printPatternInfo(
          patternClass: 'Creational patterns',
          patternName: 'Dart Singleton',
        );
        Pattern.dartSingleton();
        break;
      case 3:
        _printPatternInfo(
          patternClass: 'Creational patterns',
          patternName: 'Dart Prototype',
        );
        Pattern.dartPrototype();
        break;
      case 4:
        _printPatternInfo(
          patternClass: 'Creational patterns',
          patternName: 'Dart Factory Method',
        );
        Pattern.dartFactoryMethod();
        break;
      case 5:
        _printPatternInfo(
          patternClass: 'Creational patterns',
          patternName: 'Dart Builder',
        );
        Pattern.dartBuilder();
        break;
      case 6:
        _printPatternInfo(
          patternClass: 'Creational patterns',
          patternName: 'Dart Abstract Factory',
        );
        Pattern.dartAbstractFactory();
        break;
      /**
     * ## Structural patterns
     */
      case 7:
        _printPatternInfo(
          patternClass: 'Structural patterns',
          patternName: 'Dart Adapter',
        );
        Pattern.dartAdapter();
        break;
      case 8:
        _printPatternInfo(
          patternClass: 'Structural patterns',
          patternName: 'Dart Bridge',
        );
        Pattern.dartBridge();
        break;

      default:
        print(index != 0 ? 'Not Exist' : 'Exit');
    }
  } while (index != 0);
}
