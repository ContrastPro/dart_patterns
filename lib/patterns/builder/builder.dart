/**
 *
 * ## The essence of the pattern.
 *
 * * Builder is a generative design pattern that lets you create complex objects
 *   step by step. The builder makes it possible to use the same building code to get
 *   different representations of objects.
 *
 * ## [Director]
 *
 * * You can go a step further and split the calls to the builder methods into a
 *   separate class called the director. In this case, the director will set the order
 *   of the construction steps, and the builder will carry them out.
 *
 * * A separate director class is not strictly required. You can also call builder methods
 *   directly from client code. However, a director is useful if you have multiple ways to
 *   design products that differ in order and design steps. In this case, you will be able to
 *   combine all this logic in one class.
 *
 *   This class structure will completely hide
 *   the process of constructing objects from the client code. The client will only have to
 *   bind the desired builder to the director, and then receive the finished result from the builder.
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
 *
 * ## Implementation steps:
 *
 * (1) Make sure that creating different representations of an object can be reduced to
 *     general steps.
 *
 * (2) The [Builder] interface declares all the possible stages and steps of the product
 *     configuration.
 */
abstract class Builder {
  void setCarType(CarType carType);

  void setEngine(Engine engine);

  void setSeats(int seats);
}

/**
 * (3) Concrete builders implement the steps declared in the interface.
 *     For each of the product object representations, create one builder class and
 *     implement their building methods.
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
 * (4) Unlike other building patterns, Builders can create completely different products
 *     with no common interface.
 *
 *     In this case, we produce the car's user manual [ManualBuilder] using the same steps
 *     as the cars [CarBuilder] themselves. This device will allow you to create manuals for
 *     specific car models, containing certain components.
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
 * [Car] — this is the first product class.
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
 * [Manual] — this is the second product. Note that the manual and the vehicle itself
 * do not have a common parent class. They are essentially independent.
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
 * One of the components of the [Car].
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
 * The director knows in what order to make the builder work. He works with it
 * through the general Builder interface. Because of this, he may not know what
 * specific product is currently being built.
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
/**
 * (5) The client code will need to create both the builder objects and the director object.
 *     Before starting construction, the client must link a specific builder with a director.
 *     This can be done either through the constructor, or through the setter, or by feeding the
 *     builder directly into the director's construction method.
 */
