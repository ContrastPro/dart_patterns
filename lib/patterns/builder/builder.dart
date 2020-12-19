/**
 *
 * ## The essence of the pattern.
 *
 * * Builder is a creational design pattern that lets you construct complex
 *   objects step by step. The pattern allows you to produce different types and
 *   representations of an object using the same construction code.
 *
 *
 * ## [Director]
 *
 * * You can go further and extract a series of calls to the builder steps you
 *   use to construct a product into a separate class called director.
 *   The director class defines the order in which to execute the building steps,
 *   while the builder provides the implementation for those steps.
 *
 * * Having a director class in your program isn’t strictly necessary. You can
 *   always call the building steps in a specific order directly from the client
 *   code. However, the director class might be a good place to put various
 *   construction routines so you can reuse them across your program.
 *
 *   In addition, the director class completely hides the details of product
 *   construction from the client code. The client only needs to associate
 *   a builder with a director, launch the construction with the director, and
 *   get the result from the builder.
 *
 *
 * ## Applicability.
 *
 * * Use the Builder pattern when you want your code to be able to create
 *   different representations of some product (for example, Cars and
 *   cars Manual).
 *
 * * The Builder pattern can be applied when construction of various
 *   representations of the product involves similar steps that differ only
 *   in the details.
 *
 *   The base builder interface defines all possible
 *   construction steps, and concrete builders implement these steps to
 *   construct particular representations of the product. Meanwhile, the
 *   director class guides the order of construction.
 *
 *
 * ## Implementation steps:
 *
 * (1) Make sure that you can clearly define the common construction steps for
 *     building all available product representations. Otherwise, you won’t be
 *     able to proceed with implementing the pattern.
 *
 * (2) Declare these steps in the base [Builder] interface.
 */
abstract class Builder {
  void setCarType(CarType carType);

  void setEngine(Engine engine);

  void setSeats(int seats);
}

/**
 * (3) Create a concrete builder class for each of the product representations
 *     and implement their construction steps.
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
 * (4) Unlike other building patterns, Builders can create completely different
 *     products with no common interface.
 *
 *     In this case, we produce the car's user manual [ManualBuilder] using the
 *     same steps as the cars [CarBuilder] themselves. This class will allow
 *     you to create manuals for specific car models, containing certain
 *     components.
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
 * [Manual] — this is the second product. Note that the manual and the vehicle
 * itself do not have a common parent class. They are essentially independent.
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
  /**
   * (5) The client code creates both the builder and the director objects.
   *     Before construction starts, the client must pass a builder object to
   *     the director. Usually, the client does this only once, via parameters
   *     of the director’s constructor. The director uses the builder object in
   *     all further construction. There’s an alternative approach, where the
   *     builder is passed directly to the construction method of the director.
   */
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
