import 'dart:math';

import '../memory_controller.dart';

void badExampleFlyweight(MemoryController memoryController) {
  // Steel
  putSteelFurnace(memoryController);
  putSteelFurnace(memoryController);

  // Electric
  putElectricFurnace(memoryController);
  putElectricFurnace(memoryController);
  putElectricFurnace(memoryController);
  putElectricFurnace(memoryController);
}

void putSteelFurnace(MemoryController memoryController) {
  final Furnace furnace = SteelFurnace(
    furnace: "Steel",
    controller: memoryController,
  );
  furnace.render(Random().nextInt(999), Random().nextInt(999));
}

void putElectricFurnace(MemoryController memoryController) {
  final Furnace furnace = ElectricFurnace(
    furnace: "Electric",
    controller: memoryController,
  );

  furnace.render(Random().nextInt(999), Random().nextInt(999));
}

//
abstract class Furnace {
  void render(int x, int y);
}

class SteelFurnace implements Furnace {
  final String _furnace;
  static const String _texture = "texture 3000px";

  SteelFurnace({String furnace, MemoryController controller})
      : _furnace = furnace {
    print("\nCreate ${furnace.toUpperCase()} Furnace");
    controller.addToMemory(3);
  }

  @override
  void render(int x, int y) {
    print(
        "$_furnace Furnace with [$_texture] render on coordinates X: $x, Y: $y");
  }
}

class ElectricFurnace implements Furnace {
  final String _furnace;
  static const String _texture = "texture 5000px";

  ElectricFurnace({String furnace, MemoryController controller})
      : _furnace = furnace {
    print("\nCreate ${furnace.toUpperCase()} Furnace");
    controller.addToMemory(5);
  }

  @override
  void render(int x, int y) {
    print(
        "$_furnace Furnace with [$_texture] render on coordinates X: $x, Y: $y");
  }
}
