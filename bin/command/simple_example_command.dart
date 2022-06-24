void simpleExampleCommand() {
  final LightOutside lightOutside = LightOutside();

  final Command switchOnCommand = SwitchOnCommand(lightOutside);

  // Мы не можем групировать функции, но можем групировать объекты
  // если нам нужно вызвать только определённые методы у определённых оъектах
  // мы инкапсулируем методы объекта путём создания оъектов для каждого метода
  final Program eveningProgram = Program();
  eveningProgram.addCommand(switchOnCommand);
  eveningProgram.startProgram();
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
  final LightOutside _lightOutside;

  SwitchOnCommand(this._lightOutside);

  @override
  void execute() {
    _lightOutside.switchOn();
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

  void startProgram() {
    _listOfCommand.forEach((element) {
      element.execute();
    });
  }
}
