/**
 *
 * ## The essence of the pattern.
 *
 * * Builder is a generative design pattern that lets you create complex objects
 *   step by step. The builder makes it possible to use the same building code to get
 *   different representations of objects.
 *
 *
 * ## Applicability.
 *
 * * When your code needs to create different representations of some object.
 *   For example, Cars and cars Manual.
 *
 *   The builder can be used if the creation of multiple representations of an object
 *   consists of the same steps that differ in detail. The builder interface will define
 *   all possible construction steps. Each view will have its own builder class.
 *   And the order of the construction stages will be set by the class director.
 *
 * ## Implementation steps:
 *
 * (1) Интерфейс Строителя объявляет все возможные этапы и шаги конфигурации
 * продукта.
 */
abstract class Builder {
  void setCarType(CarType carType);

  void setEngine(Engine engine);

  void setSeats(int seats);
}

/**
 * (2) Конкретные строители реализуют шаги, объявленные в общем интерфейсе.
 */
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

/**
 * (3) В отличие от других создающих паттернов, Строители могут создавать совершенно
 * разные продукты, не имеющие общего интерфейса.
 *
 * В данном случае мы производим руководство пользователя автомобиля с помощью
 * тех же шагов, что и сами автомобили. Это устройство позволит создавать
 * руководства под конкретные модели автомобилей, содержащие те или иные фичи.
 */
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

/**
 * Автомобиль — это класс продукта.
 */
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

/**
 * Руководство автомобиля — это второй продукт. Заметьте, что руководство и сам
 * автомобиль не имеют общего родительского класса. По сути, они независимы.
 */
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

/**
 * Одна из фишек автомобиля.
 */
class Engine {
  final double volume;
  final double mileage;

  Engine(this.volume, this.mileage);

  double getVolume() => volume;

  double getMileage() => mileage;
}

enum CarType { CITY_CAR, SPORTS_CAR }

/**
 * Директор знает в какой последовательности заставлять работать строителя. Он
 * работает с ним через общий интерфейс Строителя. Из-за этого, он может не
 * знать какой конкретно продукт сейчас строится.
 */
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
