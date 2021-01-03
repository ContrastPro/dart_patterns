void main() {
  ApplicationStyle application = ApplicationStyle();
  application.configureStyle(Platform.IOS);
}

enum Platform { Android, IOS }

class ApplicationStyle {
  AbstractFactory _abstractFactory;
  Button _button;
  AppBar _appBar;

  void configureStyle(Platform platform) {
    switch (platform) {
      case Platform.Android:
        _abstractFactory = AndroidFactory();
        break;
      case Platform.IOS:
        _abstractFactory = IOSFactory();
        break;
    }
    _createStyle();
  }

  void _createStyle() {
    _button = _abstractFactory.createButton();
    _appBar = _abstractFactory.createAppBar();


    _button.paintButton();
    _appBar.paintAppBar();
  }
}

// Button
abstract class Button {
  void paintButton();
}

class AndroidButton implements Button {
  void paintButton() {
    print("You have created Android Buttons");
  }
}

class IOSButton implements Button {
  void paintButton() {
    print("You have created IOS Buttons");
  }
}

// AppBar
abstract class AppBar {
  void paintAppBar();
}

class AndroidAppBar implements AppBar {
  void paintAppBar() {
    print("You have created Android AppBar");
  }
}

class IOSAppBar implements AppBar {
  void paintAppBar() {
    print("You have created IOS AppBar");
  }
}

// Factory
abstract class AbstractFactory {
  Button createButton();

  AppBar createAppBar();
}

class AndroidFactory implements AbstractFactory {
  @override
  Button createButton() => AndroidButton();

  @override
  AppBar createAppBar() => AndroidAppBar();
}

class IOSFactory implements AbstractFactory {
  @override
  Button createButton() => IOSButton();

  @override
  AppBar createAppBar() => IOSAppBar();
}
