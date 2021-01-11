import 'dart:math';

import 'bad_example_flyweight.dart';
import 'memory_controller.dart';

void main() {
  MemoryController memoryController = MemoryController();

  badExampleFlyweight(memoryController);

  /*// Steel
  putSteelFurnace(memoryController);
  putSteelFurnace(memoryController);

  // Electric
  putElectricFurnace(memoryController);
  putElectricFurnace(memoryController);
  putElectricFurnace(memoryController);
  putElectricFurnace(memoryController);*/
}

void putSteelFurnace(MemoryController memoryController) {
  final FurnaceFactory furnaceFactory = FurnaceFactory(
    furnace: "Steel",
    controller: memoryController,
  );
  furnaceFactory.furnace.render(Random().nextInt(999), Random().nextInt(999));
}

void putElectricFurnace(MemoryController memoryController) {
  final FurnaceFactory furnaceFactory = FurnaceFactory(
    furnace: "Electric",
    controller: memoryController,
  );
  furnaceFactory.furnace.render(Random().nextInt(999), Random().nextInt(999));
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

class FurnaceFactory {
  static final Map<String, Furnace> _furnaceCollection = {};

  final Furnace furnace;

  FurnaceFactory({String furnace, MemoryController controller})
      : furnace = _getFurnace(furnace, controller);

  static Furnace _getFurnace(String furnaceType, MemoryController controller) {
    switch (furnaceType) {
      case "Steel":
        return _furnaceCollection.putIfAbsent(furnaceType, () {
          return SteelFurnace(furnace: furnaceType, controller: controller);
        });
        break;
      default:
        return _furnaceCollection.putIfAbsent(furnaceType, () {
          return ElectricFurnace(furnace: furnaceType, controller: controller);
        });
    }
  }
}
