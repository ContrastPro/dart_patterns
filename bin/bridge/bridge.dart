void main() {
  final MaterialDesign materialDesign = AndroidDesign(widget: Button());
  materialDesign.setDesign();

  /*List<MaterialDesign> componentList = [
    AndroidDesign(widget: Button()),
    IOSDesign(widget: AppBar()),
  ];

  componentList.forEach((component) {
    component.setDesign();
  });*/
}

// Abstraction
abstract class MaterialDesign {
  Widget widget;

  MaterialDesign(this.widget);

  void setDesign();
}

class AndroidDesign extends MaterialDesign {
  AndroidDesign({Widget widget}) : super(widget);

  @override
  void setDesign() {
    widget.render(design: "Android design");
  }
}

class IOSDesign extends MaterialDesign {
  IOSDesign({Widget widget}) : super(widget);

  @override
  void setDesign() {
    widget.render(design: "IOS design");
  }
}

// Implementation
abstract class Widget {
  void render({String design});
}

class Button implements Widget {
  @override
  void render({String design}) {
    print("Button render with $design");
  }
}

class AppBar implements Widget {
  @override
  void render({String design}) {
    print("AppBar render with $design");
  }
}
