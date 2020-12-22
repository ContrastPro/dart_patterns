void main() => _dartChainOfResponsibility();

void _dartChainOfResponsibility() {
  Notifier infoNotifier = InfoNotifier(Priority.INFO);
  Notifier debugNotifier = DebugNotifier(Priority.DEBUG);
  Notifier errorNotifier = ErrorNotifier(Priority.ERROR);

  infoNotifier.notifier = debugNotifier;
  debugNotifier.notifier = errorNotifier;

  infoNotifier.notifierManager("Everything is OK", Priority.INFO);
  print('\n');
  infoNotifier.notifierManager("App was build successful", Priority.DEBUG);
  print('\n');
  infoNotifier.notifierManager("Something went WRONG", Priority.ERROR);
}

abstract class Notifier {
  int _priority;
  Notifier _notifier;

  Notifier(this._priority);

  set notifier(Notifier nextNotifier) {
    _notifier = nextNotifier;
  }

  void notifierManager(String message, int level) {
    if (level >= _priority) {
      write(message);
    }
    if (_notifier != null) {
      _notifier.notifierManager(message, level);
    }
  }

  void write(String message);
}

class InfoNotifier extends Notifier {
  InfoNotifier(int priority) : super(priority);

  @override
  void write(String message) {
    print("[INFO]: $message");
  }
}

class DebugNotifier extends Notifier {
  DebugNotifier(int priority) : super(priority);

  @override
  void write(String message) {
    print("[DEBUG]: $message");
  }
}

class ErrorNotifier extends Notifier {
  ErrorNotifier(int priority) : super(priority);

  @override
  void write(String message) {
    print("[ERROR]: $message");
  }
}

class Priority {
  static const int INFO = 1;
  static const int DEBUG = 2;
  static const int ERROR = 3;
}
