import 'dart:math';

void badExampleFlyweight() {
  //
  putSteelFurnace();
  putSteelFurnace();

  //
  putElectricFurnace();
  putElectricFurnace();
  putElectricFurnace();
  putElectricFurnace();
}

void putSteelFurnace() {
  final Furnace furnace = SteelFurnace(furnace: "Steel");
  furnace.render(Random().nextInt(999), Random().nextInt(999));
}

void putElectricFurnace() {
  final Furnace furnace = ElectricFurnace(furnace: "Electric");
  furnace.render(Random().nextInt(999), Random().nextInt(999));
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
