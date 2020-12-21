import '../../patterns/сhain_of_responsibility/сhain_of_responsibility.dart';

class BehavioralPattern {
  /**
   * ## [ChainOfResponsibility]
   */
  static void dartChainOfResponsibility() {
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
}
