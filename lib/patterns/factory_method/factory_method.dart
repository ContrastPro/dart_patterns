void main() => _dartFactoryMethod();

void _dartFactoryMethod() {
  final windowsButton = FloatingActionButton.extended(OperationSystem.windows);
  final iosButton = FloatingActionButton.extended(OperationSystem.ios);

  print("Created $windowsButton.");
  print("Created $iosButton.");
}

abstract class Button {
  FactoryMethod factoryMethod;
  String currentPlatform;
}

class FactoryMethod {
  final double width;
  final double height;
  final String color;

  FactoryMethod(this.width, this.height, this.color);

  @override
  String toString();
}

class WindowsButton extends Button {
  final FactoryMethod factoryMethod;

  WindowsButton({double width, double height, String color})
      : factoryMethod = FactoryMethod(width, height, color);

  @override
  String toString() =>
      "FAB for $currentPlatform, Color: ${factoryMethod.color}";
}

class IOSButton extends Button {
  final FactoryMethod factoryMethod;

  IOSButton({double width, double height, String color})
      : factoryMethod = FactoryMethod(width, height, color);

  @override
  String toString() =>
      "FAB for $currentPlatform, Color: ${factoryMethod.color}";
}

enum OperationSystem { windows, ios }

class FloatingActionButton {
  static Button extended(OperationSystem operationSystem) {
    Button button;
    switch (operationSystem) {
      case OperationSystem.windows:
        button = WindowsButton(width: 10, height: 20, color: "Blue");
        button.currentPlatform = "Windows";
        break;
      case OperationSystem.ios:
        button = IOSButton(width: 20, height: 30, color: "White");
        button.currentPlatform = "IOS";
        break;
    }
    return button;
  }
}
