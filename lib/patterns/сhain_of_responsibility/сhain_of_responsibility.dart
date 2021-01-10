void main() {
  final Logger consoleLogger = ConsoleLogger();
  final Logger fileLogger = FileLogger();

  consoleLogger.setNextLoggerInChain(fileLogger);

  consoleLogger.handleRequest(1);
  consoleLogger.handleRequest(2);
}

abstract class Logger {
  // usually # protected
  Logger nextLogger;

  void setNextLoggerInChain(Logger logger) {
    nextLogger = logger;
  }

  /*void print(int number) {
    handleRequest(number);

    // будет вынужденна пройти по всей цепочке даже если
    // в этом нет необходимости
    if (nextLogger != null) {
      nextLogger.print(number);
    }
  }*/

  // можно передавать ссылку на следующий logger
  // через параметры
  void handleRequest(int number);
}

class ConsoleLogger extends Logger {
  @override
  void handleRequest(int number) {
    if (number == 1) {
      print("[CONSOLE] $number");
    } else if (nextLogger != null) {
      nextLogger.handleRequest(number);
    }
  }
}

class FileLogger extends Logger {
  @override
  void handleRequest(int number) {
    if (number == 2) {
      print("[FILE] $number");
    } else if (nextLogger != null) {
      nextLogger.handleRequest(number);
    }
  }
}
