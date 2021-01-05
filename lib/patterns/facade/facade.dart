void main() {
  final PC pc = PC();

  pc.turnOn();
  pc.turnOff();
}

class PC {
  final _motherboard = Motherboard();
  final _hardDrive = HardDrive();
  final _graphicsCard = GraphicsCard();

  void turnOn() {
    print("PC turned ON\n");
    _motherboard.motherboardOn();
    _hardDrive.hardOn();
    _graphicsCard.cardOn();
  }

  void turnOff() {
    print("\n\nPC turned OFF\n");
    _motherboard.motherboardOff();
    _hardDrive.hardOff();
    _graphicsCard.cardOff();
  }
}

class Motherboard {
  void motherboardOn() =>
      print("The motherboard is ON and has started the hard drive");

  void motherboardOff() =>
      print("The motherboard is OFF and the hard drive has stopped");
}

class HardDrive {
  void hardOn() => print("The hard disk boots the operation system");

  void hardOff() => print("Hard disk shutdown");
}

class GraphicsCard {
  void cardOn() => print("The video card displays the image on the screen");

  void cardOff() => print("Video card is off");
}
