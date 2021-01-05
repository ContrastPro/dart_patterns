void complexBuilder() {
  final Director director = Director();

  //
  final CarBuilder carBuilder = CarBuilder();
  director.constructSportsCar(carBuilder);
  final Car car = carBuilder.build();
  print("Car built: ${car.getCarType()}\n");

  //
  final ManualBuilder manualBuilder = ManualBuilder();
  director.constructSportsCar(manualBuilder);
  final Manual manual = manualBuilder.build();
  print(manual.printManualInfo());
}

enum CarType { CITY_CAR, SPORTS_CAR }

class Director {
  void constructSportsCar(Builder builder) {
    builder.createCar();
    builder.setCarType(CarType.SPORTS_CAR);
    builder.setEngine(Engine(11, 25000));
    builder.setSeats(2);
  }

  void constructCityCar(Builder builder) {
    builder.createCar();
    builder.setCarType(CarType.CITY_CAR);
    builder.setEngine(Engine(2.8, 490000));
    builder.setSeats(4);
  }
}

abstract class Builder {
  void createCar();

  void setCarType(CarType carType);

  void setEngine(Engine engine);

  void setSeats(int seats);
}

class CarBuilder implements Builder {
  Car _car;

  @override
  void createCar() => _car = Car();

  @override
  void setCarType(CarType carType) => _car.carType = carType;

  @override
  void setEngine(Engine engine) => _car.engine = engine;

  @override
  void setSeats(int seats) => _car.seats = seats;

  Car build() => _car;
}

class ManualBuilder implements Builder {
  Manual _manual;

  @override
  void createCar() => _manual = Manual();

  @override
  void setCarType(CarType carType) => _manual.carType = carType;

  @override
  void setEngine(Engine engine) => _manual.engine = engine;

  @override
  void setSeats(int seats) => _manual.seats = seats;

  Manual build() => _manual;
}

class Car {
  CarType _carType;
  Engine _engine;
  int _seats;

  set carType(CarType value) => _carType = value;

  set engine(Engine value) => _engine = value;

  set seats(int value) => _seats = value;

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
  CarType _carType;
  Engine _engine;
  int _seats;

  set carType(CarType value) => _carType = value;

  set engine(Engine value) => _engine = value;

  set seats(int value) => _seats = value;

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
