import 'dart:math';

import 'bad_example_flyweight.dart';

void main() {
  badExampleFlyweight();

  /*//
  putSteelFurnace();
  putSteelFurnace();

  //
  putElectricFurnace();
  putElectricFurnace();
  putElectricFurnace();
  putElectricFurnace();*/
}

void putSteelFurnace() {
  final FurnaceFactory furnaceFactory = FurnaceFactory(furnace: "Steel");
  furnaceFactory.furnace.render(Random().nextInt(999), Random().nextInt(999));
}

void putElectricFurnace() {
  final FurnaceFactory furnaceFactory = FurnaceFactory(furnace: "Electric");
  furnaceFactory.furnace.render(Random().nextInt(999), Random().nextInt(999));
}

//
abstract class Furnace {
  void render(int x, int y);
}

class SteelFurnace implements Furnace {
  final String _furnace;
  static const String _texture = "texture 3000px";

  SteelFurnace({String furnace}) : _furnace = furnace {
    print("\nCreate ${furnace.toUpperCase()} Furnace");
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

  ElectricFurnace({String furnace}) : _furnace = furnace {
    print("\nCreate ${furnace.toUpperCase()} Furnace");
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

  FurnaceFactory({String furnace}) : furnace = _getFurnace(furnace);

  static Furnace _getFurnace(String furnaceType) {
    switch (furnaceType) {
      case "Steel":
        return _furnaceCollection.putIfAbsent(furnaceType, () {
          return SteelFurnace(furnace: furnaceType);
        });
        break;
      default:
        return _furnaceCollection.putIfAbsent(furnaceType, () {
          return ElectricFurnace(furnace: furnaceType);
        });
    }
  }
}
