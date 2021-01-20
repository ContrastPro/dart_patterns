void complexExampleCommand() {
  final LightOutside lightOutside = LightOutside();
  final Heating heating = Heating();

  final SwitchOnCommand switchOnCommand = SwitchOnCommand(lightOutside);
  final SwitchOffCommand switchOffCommand = SwitchOffCommand(lightOutside);
  final HeatingStartCommand heatingStartCommand = HeatingStartCommand(heating);
  final HeatingStopCommand heatingStopCommand = HeatingStopCommand(heating);

  // Создаём макрос для вечера
  print("*** Evening ***");
  final Program eveningProgram = Program()
    ..addCommand(heatingStartCommand)
    ..addCommand(switchOnCommand)
    ..startProgram();

  // Создаём макрос для утра
  print("\n*** Morning ***");
  final Program morningProgram = eveningProgram;
  morningProgram
    ..deleteCommand(switchOnCommand)
    ..addCommand(switchOffCommand)
    ..startProgram();
}

// Receiver Приёмник команд
class LightOutside {
  void switchOn() {
    print("Light's outside switched ON");
  }

  void switchOff() {
    print("Light's outside switched OFF");
  }
}

class Heating {
  void start() {
    print("Heating home is STARTED");
  }

  void stop() {
    print("Heating home is STOPPED");
  }
}

// Command
abstract class Command {
  void execute();
}

// Concrete commands
class SwitchOnCommand implements Command {
  final LightOutside _lightOutside;

  SwitchOnCommand(this._lightOutside);

  @override
  void execute() {
    _lightOutside.switchOn();
  }
}

class SwitchOffCommand implements Command {
  final LightOutside _lightOutside;

  SwitchOffCommand(this._lightOutside);

  @override
  void execute() {
    _lightOutside.switchOff();
  }
}

class HeatingStartCommand implements Command {
  final Heating _heating;

  HeatingStartCommand(this._heating);

  @override
  void execute() {
    _heating.start();
  }
}

class HeatingStopCommand implements Command {
  final Heating _heating;

  HeatingStopCommand(this._heating);

  @override
  void execute() {
    _heating.start();
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

  void deleteCommand(Command command) {
    if (_listOfCommand.contains(command)) {
      _listOfCommand.remove(command);
    }
  }

  void startProgram() {
    _listOfCommand.forEach((element) {
      element.execute();
    });
  }
}
