void simpleExampleCommand() {
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
