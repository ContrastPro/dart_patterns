import 'bad_example_chain_of_responsibility.dart';

void main() {
  badExampleChainOfResponsibility();

  /*final Logger firstLogger = FirstLogger();
  final Logger secondLogger = SecondLogger();
  final Logger thirdLogger = ThirdLogger();

  firstLogger.setNextLoggerInChain(secondLogger);
  secondLogger.setNextLoggerInChain(thirdLogger);

  firstLogger.handleRequest(Translate.EnglishToChinese);*/
}

enum Translate {
  EnglishToGerman,
  EnglishToChinese,
  EnglishToRussian,
  EnglishToJapanese,
}

abstract class Logger {
  // usually # protected
  Logger nextLogger;

  void setNextLoggerInChain(Logger logger) {
    nextLogger = logger;
  }

  // можно передавать ссылку на следующий logger через параметры
  void handleRequest(Translate translate);
}

class FirstLogger extends Logger {
  @override
  void handleRequest(Translate translate) {
    if (translate == Translate.EnglishToGerman) {
      print("[FIRST LOGGER] Translate English to German");
    } else if (nextLogger != null) {
      nextLogger.handleRequest(translate);
    }
  }
}

class SecondLogger extends Logger {
  @override
  void handleRequest(Translate translate) {
    if (translate == Translate.EnglishToChinese) {
      print("[SECOND LOGGER] Translate English to Chinese");
    } else if (nextLogger != null) {
      nextLogger.handleRequest(translate);
    }
  }
}

class ThirdLogger extends Logger {
  @override
  void handleRequest(Translate translate) {
    if (translate == Translate.EnglishToRussian) {
      print("[THIRD LOGGER] Translate English to Russian");
    } else if (nextLogger != null) {
      nextLogger.handleRequest(translate);
    }
  }
}
