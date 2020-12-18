import 'dart:io';
import 'build_patterns/structural/structural.dart';
import 'build_patterns/сreational/сreational.dart';
import 'test/test.dart';

void main() => runApp();

void runApp() {
  int index;
  do {
    print('\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
    print("Enter number:");
    index = int.parse(stdin.readLineSync());
    if (index >= 1 && index <= 6) {
      _buildCreational(index);
    } else if (index >= 7 && index <= 13) {
      _buildStructural(index);
    } else if (index == 3141) {
      Test.customTest();
    } else {
      print(index != 0 ? 'Not Exist' : 'Exit');
    }
  } while (index != 0);
}

/**
 * Print information about chosen pattern
 */
void _printPatternInfo({String patternClass, String patternName}) {
  print('------------------------------------------------\n'
      '| # $patternClass -> $patternName # |'
      '\n------------------------------------------------');
}

/**
 * ## Creational patterns
 */
void _buildCreational(int index) {
  switch (index) {
    case 1:
      _printPatternInfo(
        patternClass: 'Creational patterns',
        patternName: 'Custom Singleton',
      );
      CreationalPattern.customSingleton();
      break;
    case 2:
      _printPatternInfo(
        patternClass: 'Creational patterns',
        patternName: 'Dart Singleton',
      );
      CreationalPattern.dartSingleton();
      break;
    case 3:
      _printPatternInfo(
        patternClass: 'Creational patterns',
        patternName: 'Dart Prototype',
      );
      CreationalPattern.dartPrototype();
      break;
    case 4:
      _printPatternInfo(
        patternClass: 'Creational patterns',
        patternName: 'Dart Builder',
      );
      CreationalPattern.dartBuilder();
      break;
    case 5:
      _printPatternInfo(
        patternClass: 'Creational patterns',
        patternName: 'Dart Factory Method',
      );
      CreationalPattern.dartFactoryMethod();
      break;
    case 6:
      _printPatternInfo(
        patternClass: 'Creational patterns',
        patternName: 'Dart Abstract Factory',
      );
      CreationalPattern.dartAbstractFactory();
      break;
  }
}

/**
 * ## Structural patterns
 */
void _buildStructural(int index) {
  switch (index) {
    case 7:
      _printPatternInfo(
        patternClass: 'Structural patterns',
        patternName: 'Dart Adapter',
      );
      StructuralPattern.dartAdapter();
      break;
    case 8:
      _printPatternInfo(
        patternClass: 'Structural patterns',
        patternName: 'Dart Bridge',
      );
      StructuralPattern.dartBridge();
      break;
    case 9:
      _printPatternInfo(
        patternClass: 'Structural patterns',
        patternName: 'Dart Composite',
      );
      StructuralPattern.dartComposite();
      break;
    case 10:
      _printPatternInfo(
        patternClass: 'Structural patterns',
        patternName: 'Dart Decorator',
      );
      StructuralPattern.dartDecorator();
      break;
    case 11:
      _printPatternInfo(
        patternClass: 'Structural patterns',
        patternName: 'Dart Facade',
      );
      StructuralPattern.dartFacade();
      break;
    case 12:
      _printPatternInfo(
        patternClass: 'Structural patterns',
        patternName: 'Dart Flyweight',
      );
      StructuralPattern.dartFlyweight();
      break;
    case 13:
      _printPatternInfo(
        patternClass: 'Structural patterns',
        patternName: 'Dart Proxy',
      );
      StructuralPattern.dartProxy();
      break;
  }
}
