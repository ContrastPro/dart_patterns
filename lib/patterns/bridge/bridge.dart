void main() {
  /*final Framework flutterIOS = FlutterEngine(flutterSDK: FlutterIOS());
  flutterIOS.runApp();*/

  List<Framework> frameworkList = [
    FlutterEngine(flutterSDK: FlutterWindows()),
    FlutterEngine(flutterSDK: FlutterIOS()),
  ];

  frameworkList.forEach((framework) {
    framework.runApp();
  });
}

// Abstraction
abstract class Framework {
  FlutterSDK flutterSDK;

  void runApp();
}

class FlutterEngine extends Framework {
  FlutterSDK flutterSDK;

  FlutterEngine({this.flutterSDK});

  @override
  void runApp() {
    this.flutterSDK.buildApp();
  }
}

// Implementation
abstract class FlutterSDK {
  void buildApp();
}

class FlutterWindows implements FlutterSDK {
  @override
  void buildApp() {
    print("Flutter app build for Windows");
  }
}

class FlutterIOS implements FlutterSDK {
  @override
  void buildApp() {
    print("Flutter app build for IOS");
  }
}
