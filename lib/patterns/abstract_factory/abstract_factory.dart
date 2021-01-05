void main() {
  ApplicationStyle.configureStyle(Platform.IOS);
}

enum Platform { Android, IOS }

class ApplicationStyle {
  static void configureStyle(Platform platform) {
    AbstractFactory abstractFactory;
    Button button;
    AppBar appBar;

    switch (platform) {
      case Platform.Android:
        abstractFactory = AndroidFactory();
        abstractFactory.currentPlatform = "Android";
        break;
      case Platform.IOS:
        abstractFactory = IOSFactory();
        abstractFactory.currentPlatform = "IOS";
        break;
    }
    button = abstractFactory.createButton();
    appBar = abstractFactory.createAppBar();

    button.renderButton();
    appBar.renderAppBar();
  }
}

// Factory
abstract class AbstractFactory {
  String currentPlatform;

  Button createButton();

  AppBar createAppBar();
}

class AndroidFactory implements AbstractFactory {
  @override
  String currentPlatform;

  @override
  Button createButton() => AndroidButton(currentPlatform);

  @override
  AppBar createAppBar() => AndroidAppBar(currentPlatform);
}

class IOSFactory implements AbstractFactory {
  @override
  String currentPlatform;

  @override
  Button createButton() => IOSButton(currentPlatform);

  @override
  AppBar createAppBar() => IOSAppBar(currentPlatform);
}

// Button
abstract class Button {
  void renderButton();
}

class AndroidButton implements Button {
  final String _platform;

  AndroidButton(this._platform);

  @override
  void renderButton() {
    print("You have created $_platform Buttons");
  }
}

class IOSButton implements Button {
  final String _platform;

  IOSButton(this._platform);

  @override
  void renderButton() {
    print("You have created $_platform Buttons");
  }
}

// AppBar
abstract class AppBar {
  void renderAppBar();
}

class AndroidAppBar implements AppBar {
  final String _platform;

  AndroidAppBar(this._platform);

  @override
  void renderAppBar() {
    print("You have created $_platform AppBar");
  }
}

class IOSAppBar implements AppBar {
  final String _platform;

  IOSAppBar(this._platform);

  @override
  void renderAppBar() {
    print("You have created $_platform AppBar");
  }
}
