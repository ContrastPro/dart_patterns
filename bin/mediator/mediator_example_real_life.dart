void mediatorExampleRealLife() {
  final OdessaATC odessaATC = OdessaATC();

  final Flight747 flight747 = Flight747(odessaATC, "Flight747");
  final Flight1011 flight1011 = Flight1011(odessaATC, "Flight1011");
  final Flight112 flight112 = Flight112(odessaATC, "Flight112");
  final Flight7E7 flight7E7 = Flight7E7(odessaATC, "Flight7E7");

  odessaATC
    ..addFlights(flight747)
    ..addFlights(flight1011)
    ..addFlights(flight112)
    ..addFlights(flight7E7);

  flight747.sendMassage("Приближаеться шторм");
  print("\n******\n");
  flight112.sendMassage("Легкое облединение взлётной полосы");
}

//Colleague
abstract class AirTransport {
  final AirTrafficControl _trafficControl;
  final String _flightName;

  AirTransport(this._trafficControl, this._flightName);

  void sendMassage(String massage) {
    _trafficControl.notifyFlights(this, massage);
  }

  void getMassage(String massage);
}

class Flight747 extends AirTransport {
  Flight747(AirTrafficControl trafficControl, String flightName)
      : super(trafficControl, flightName);

  @override
  void getMassage(String massage) {
    print("$_flightName got a message from ATC: $massage");
  }
}

class Flight1011 extends AirTransport {
  Flight1011(AirTrafficControl trafficControl, String flightName)
      : super(trafficControl, flightName);

  @override
  void getMassage(String massage) {
    print("$_flightName got a message from ATC: $massage");
  }
}

class Flight112 extends AirTransport {
  Flight112(AirTrafficControl trafficControl, String flightName)
      : super(trafficControl, flightName);

  @override
  void getMassage(String massage) {
    print("$_flightName got a message from ATC: $massage");
  }
}

class Flight7E7 extends AirTransport {
  Flight7E7(AirTrafficControl trafficControl, String flightName)
      : super(trafficControl, flightName);

  @override
  void getMassage(String massage) {
    print("$_flightName got a message from ATC: $massage");
  }
}

// Mediator
abstract class AirTrafficControl {
  void notifyFlights(AirTransport airTransport, String massage);
}

class OdessaATC implements AirTrafficControl {
  List<AirTransport> _airTransport = List<AirTransport>();

  void addFlights(AirTransport airTransport) {
    _airTransport.add(airTransport);
  }

  @override
  void notifyFlights(AirTransport airTransport, String massage) {
    _airTransport.forEach((transport) {
      if (transport != airTransport) {
        transport.getMassage(massage);
      }
    });
  }
}
