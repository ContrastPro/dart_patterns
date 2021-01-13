void badExampleChainOfResponsibility() {
  final Logger firstLogger = FirstLogger();
  final Logger secondLogger = SecondLogger();
  final Logger thirdLogger = ThirdLogger();

  firstLogger.setNextLoggerInChain(secondLogger);
  secondLogger.setNextLoggerInChain(thirdLogger);

  firstLogger.print(Translate.EnglishToChinese);
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

  void print(Translate translate) {
    handleRequest(translate);

    // будет вынужденна пройти по всей цепочке даже если
    // в этом нет необходимости похоже на структуру case без brake
    if (nextLogger != null) {
      nextLogger.print(translate);
    }
  }

  // можно передавать ссылку на следующий logger через параметры
  void handleRequest(Translate translate);
}

class FirstLogger extends Logger {
  @override
  void handleRequest(Translate translate) {
    if (translate == Translate.EnglishToGerman) {
      print("[FIRST LOGGER] Translate English to German");
    }
  }
}

class SecondLogger extends Logger {
  @override
  void handleRequest(Translate translate) {
    if (translate == Translate.EnglishToChinese) {
      print("[SECOND LOGGER] Translate English to Chinese");
    }
  }
}

class ThirdLogger extends Logger {
  @override
  void handleRequest(Translate translate) {
    if (translate == Translate.EnglishToRussian) {
      print("[THIRD LOGGER] Translate English to Russian");
    }
  }
}
