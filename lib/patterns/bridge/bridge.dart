void main() => _dartBridge();

void _dartBridge() {
  final flutterWindows = FlutterEngine(flutterSDK: FlutterWindows());
  flutterWindows.runApp();

  final flutterIOS = FlutterEngine(flutterSDK: FlutterIOS());
  flutterIOS.runApp();
}

abstract class Framework {
  FlutterSDK flutterSDK;

  void runApp();
}

abstract class FlutterSDK {
  void buildApp();
}

class FlutterWindows extends FlutterSDK {
  @override
  void buildApp() {
    print("Flutter app build for Windows");
  }
}

class FlutterIOS extends FlutterSDK {
  @override
  void buildApp() {
    print("Flutter app build for IOS");
  }
}

class FlutterEngine extends Framework {
  FlutterSDK flutterSDK;

  FlutterEngine({this.flutterSDK});

  @override
  void runApp() {
    this.flutterSDK.buildApp();
  }
}
