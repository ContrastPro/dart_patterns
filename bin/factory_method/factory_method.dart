void main() {
  ButtonStyle.configureStyle(Platform.Android);
}

enum Platform { Android, IOS }

class ButtonStyle {
  static void configureStyle(Platform platform) {
    ButtonFactory buttonFactory;
    Button button;

    switch (platform) {
      case Platform.Android:
        buttonFactory = AndroidButtonFactory();
        buttonFactory.currentPlatform = "Android";
        break;
      case Platform.IOS:
        buttonFactory = IOSButtonFactory();
        buttonFactory.currentPlatform = "IOS";
        break;
    }
    button = buttonFactory.createButton();
    button.render();
  }
}

abstract class ButtonFactory {
  String currentPlatform;

  void printInfo() => print('Hello');

  Button createButton();
}

class AndroidButtonFactory extends ButtonFactory {
  @override
  Button createButton() => AndroidButton(currentPlatform);
}

class IOSButtonFactory extends ButtonFactory {
  @override
  Button createButton() => IOSButton(currentPlatform);
}

abstract class Button {
  void render();
}

class AndroidButton implements Button {
  final String _platform;

  AndroidButton(this._platform);

  @override
  void render() => print("FAB button for $_platform, render on the screen");
}

class IOSButton implements Button {
  final String _platform;

  IOSButton(this._platform);

  @override
  void render() => print("FAB button for $_platform, render on the screen");
}
