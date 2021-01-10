void complexExampleCommand() {
  final LightOutside lightOutside = LightOutside();

  final SwitchOnCommand switchOnCommand = SwitchOnCommand(lightOutside);

  final Program eveningProgram = Program();
  eveningProgram.addCommand(switchOnCommand);
  eveningProgram.start();
}

// Receiver Приёмник команд
class LightOutside {
  void switchOn() {
    print("Light's switched on");
  }

  void switchOff() {
    print("Light's switched off");
  }
}

// Command
abstract class Command {
  void execute();
}

// Concrete command
class SwitchOnCommand implements Command {
  LightOutside lightOutside;

  SwitchOnCommand(this.lightOutside);

  @override
  void execute() {
    lightOutside.switchOn();
  }
}

// Concrete command
class SwitchOffCommand implements Command {
  LightOutside lightOutside;

  SwitchOffCommand(this.lightOutside);

  @override
  void execute() {
    lightOutside.switchOff();
  }
}

// Invoker Вызывающий команды
class Program {
  List<Command> _listOfCommand = [];

  void addCommand(Command command) {
    if (!_listOfCommand.contains(command)) {
      _listOfCommand.add(command);
    }
  }

  void start() {
    _listOfCommand.forEach((element) {
      element.execute();
    });
  }
}
