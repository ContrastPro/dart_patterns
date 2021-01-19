void stateInContext() {
  final Parcel iphone7 = Parcel();
  print("\n*** Заказчик произвёл оплату ***");
  iphone7.changeParcelState();
  print("\n*** Передано международному перевозчику ***");
  iphone7.changeParcelState();
  print("\n*** Посылка находиться на сортировочном пункте ***");
  iphone7.changeParcelState();
  print("\n*** Курьер Новой доставил посылку ***");
  iphone7.changeParcelState();
}

// State
abstract class ParcelState {
  void printParcelStatus();
}

class ConfirmationOfDispatch implements ParcelState {
  @override
  void printParcelStatus() {
    print("[01.01.21] Оплата произведена, ожидание передачи перевозчику");
  }
}

class LeftCountry implements ParcelState {
  @override
  void printParcelStatus() {
    print("[03.01.21] Посылка покинула страну отправителя");
  }
}

class ArrivedInCountry implements ParcelState {
  @override
  void printParcelStatus() {
    print("[10.01.21] Посылка прибыла в страну назначения");
  }
}

class Delivered implements ParcelState {
  @override
  void printParcelStatus() {
    print("[22.01.21] Посылка доставленна заказчику");
  }
}

// Context
class Parcel {
  ParcelState _parcelState = ConfirmationOfDispatch();

  void changeParcelState() {
    _showInfo();
    if (_parcelState is ConfirmationOfDispatch) {
      _setParcelState(LeftCountry());
    } else if (_parcelState is LeftCountry) {
      _setParcelState(ArrivedInCountry());
    } else if (_parcelState is ArrivedInCountry) {
      _setParcelState(Delivered());
    }
  }

  void _setParcelState(ParcelState parcelState) {
    _parcelState = parcelState;
  }

  void _showInfo() {
    _parcelState.printParcelStatus();
  }
}
