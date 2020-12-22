void main() => _dartAbstractFactory();

void _dartAbstractFactory() {
  ApplicationStyle application = ApplicationStyle();
  application.configureStyle("IOS");
}

abstract class Button {
  void paint();
}

class WindowsButton implements Button {
  void paint() {
    print("You have created Windows Button");
  }
}

class IOSButton implements Button {
  void paint() {
    print("You have created IOS Button");
  }
}

abstract class AbstractFactory {
  Button createButton();
}

class WindowsFactory implements AbstractFactory {
  Button createButton() {
    return WindowsButton();
  }
}

class IOSFactory implements AbstractFactory {
  Button createButton() {
    return IOSButton();
  }
}

class ApplicationStyle {
  AbstractFactory _abstractFactory;
  Button _button;

  void configureStyle(String currentSystem) {
    switch (currentSystem.toLowerCase()) {
      case "windows":
        _abstractFactory = WindowsFactory();
        break;
      case "ios":
        _abstractFactory = IOSFactory();
        break;
      default:
        print("I only have two moods...");
    }
    _createStyle();
  }

  void _createStyle() {
    _button = _abstractFactory.createButton();
    _button.paint();
  }
}
