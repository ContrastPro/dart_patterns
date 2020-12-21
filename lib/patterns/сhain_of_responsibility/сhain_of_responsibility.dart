/**
 *
 * ## The essence of the pattern.
 *
 * * Chain of Responsibility is a behavioral design pattern that lets you pass
 *   requests along a chain of handlers. Upon receiving a request, each handler
 *   decides either to process the request or to pass it to the next handler
 *   in the chain.
 *
 *
 * ## Analogy from life.
 *
 * * You’ve just bought and installed a new piece of hardware on your computer.
 *   Since you’re a geek, the computer has several operating systems installed.
 *   You try to boot all of them to see whether the hardware is supported.
 *   Windows detects and enables the hardware automatically. However, your
 *   beloved Linux refuses to work with the new hardware. With a small flicker
 *   of hope, you decide to call the tech-support phone number written on
 *   the box.
 *
 *   The first thing you hear is the robotic voice of the autoresponder.
 *   It suggests nine popular solutions to various problems, none of which are
 *   relevant to your case. After a while, the robot connects you to a
 *   live operator.
 *
 *   Alas, the operator isn’t able to suggest anything specific either. He keeps
 *   quoting lengthy excerpts from the manual, refusing to listen to your
 *   comments. After hearing the phrase “have you tried turning the
 *   computer off and on again?” for the 10th time, you demand to be connected
 *   to a proper engineer.
 *
 *   Eventually, the operator passes your call to one of the engineers, who had
 *   probably longed for a live human chat for hours as he sat in his lonely
 *   server room in the dark basement of some office building. The engineer
 *   tells you where to download proper drivers for your new hardware and how to
 *   install them on Linux. Finally, the solution! You end the call, bursting
 *   with joy.
 *
 *
 * ## Applicability.
 *
 * * Use the Chain of Responsibility pattern when your program is expected to
 *   process different kinds of requests in various ways, but the exact types of
 *   requests and their sequences are unknown beforehand.
 *
 *   The pattern lets you link several handlers into one chain and, upon
 *   receiving a request, “ask” each handler whether it can process it.
 *   This way all handlers get a chance to process the request.
 *
 * * Use the pattern when it’s essential to execute several handlers in a
 *   particular order.
 *
 *   Since you can link the handlers in the chain in any order, all requests
 *   will get through the chain exactly as you planned.
 *
 *
 * ## Implementation steps:
 *
 * (1) To eliminate duplicate boilerplate code in concrete handlers, it
 *     might be worth creating an abstract base handler class, derived from
 *     the handler interface.
 */
abstract class Notifier {
  int _priority;
  Notifier _notifier;

  Notifier(this._priority);

  /**
   * (2) This class should have a field for storing a reference to the next
   *     handler in the chain. Consider making the class immutable. However,
   *     if you plan to modify chains at runtime, you need to define a setter
   *     for altering the value of the reference field.
   */
  set notifier(Notifier nextNotifier) {
    _notifier = nextNotifier;
  }

  /**
   * (3) You can also implement the convenient default behavior for the handling
   *     method, which is to forward the request to the next object unless
   *     there’s none left. Concrete handlers will be able to use this behavior
   *     by calling the parent method.
   */
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
