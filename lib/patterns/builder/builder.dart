void main() => _dartBuilder();

void _dartBuilder() {
  final director = Director();
  final carBuilder = CarBuilder();
  director.constructSportsCar(carBuilder);

  final car = carBuilder.build();
  print("Car built: ${car.getCarType()}\n");

  final manualBuilder = ManualBuilder();
  director.constructSportsCar(manualBuilder);
  final carManual = manualBuilder.build();
  print(carManual.printManualInfo());
}

abstract class Builder {
  void setCarType(CarType carType);

  void setEngine(Engine engine);

  void setSeats(int seats);
}

class CarBuilder implements Builder {
  CarType _carType;
  Engine _engine;
  int _seats;

  @override
  void setCarType(CarType carType) => this._carType = carType;

  @override
  void setEngine(Engine engine) => this._engine = engine;

  @override
  void setSeats(int seats) => this._seats = seats;

  Car build() => Car(_carType, _engine, _seats);
}

class ManualBuilder implements Builder {
  CarType _carType;
  Engine _engine;
  int _seats;

  @override
  void setCarType(CarType carType) => this._carType = carType;

  @override
  void setEngine(Engine engine) => this._engine = engine;

  @override
  void setSeats(int seats) => this._seats = seats;

  Manual build() => Manual(_carType, _engine, _seats);
}

class Car {
  final CarType _carType;
  final Engine _engine;
  final int _seats;

  Car(this._carType, this._engine, this._seats);

  String getCarType() {
    switch (_carType) {
      case CarType.SPORTS_CAR:
        return "Sport car";
        break;
      default:
        return "City car";
    }
  }
}

class Manual {
  final CarType _carType;
  final Engine _engine;
  final int _seats;

  Manual(this._carType, this._engine, this._seats);

  String getCarType() {
    switch (_carType) {
      case CarType.SPORTS_CAR:
        return "Sport car";
        break;
      default:
        return "City car";
    }
  }

  int getSeats() => _seats;

  String printManualInfo() => "Engine volume: ${_engine.getVolume()},"
      "\nEngine mileage: ${_engine.getMileage()}, "
      "\nCount of seats: ${getSeats()}";
}

class Engine {
  final double volume;
  final double mileage;

  Engine(this.volume, this.mileage);

  double getVolume() => volume;

  double getMileage() => mileage;
}

enum CarType { CITY_CAR, SPORTS_CAR }

class Director {
  void constructSportsCar(Builder builder) {
    builder.setCarType(CarType.SPORTS_CAR);
    builder.setEngine(Engine(11, 25000));
    builder.setSeats(2);
  }

  void constructCityCar(Builder builder) {
    builder.setCarType(CarType.CITY_CAR);
    builder.setEngine(Engine(2.8, 490000));
    builder.setSeats(4);
  }
}
