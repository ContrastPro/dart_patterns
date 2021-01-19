void stateInStates(){
  Parcel parcel = Parcel();
  ConfirmationOfDispatch confirmationOfDispatch = ConfirmationOfDispatch();

  parcel.setParcelState(confirmationOfDispatch);
}

// State
abstract class ParcelState {
  void printParcelStatus(Parcel parcel);
}

class ConfirmationOfDispatch implements ParcelState {
  @override
  void printParcelStatus(Parcel parcel) {
    print("[01.01.21] Оплата произведена, ожидание передачи перевозчику");
    parcel.setParcelState(LeftCountry());
  }
}

class LeftCountry implements ParcelState {
  @override
  void printParcelStatus(Parcel parcel) {
    print("[03.01.21] Посылка покинула страну отправителя");
    parcel.setParcelState(ArrivedInCountry());
  }
}

class ArrivedInCountry implements ParcelState {
  @override
  void printParcelStatus(Parcel parcel) {
    print("[10.01.21] Посылка прибыла в страну назначения");
    parcel.setParcelState(Delivered());
  }
}

class Delivered implements ParcelState {
  @override
  void printParcelStatus(Parcel parcel) {
    print("[22.01.21] Посылка доставленна заказчику");
  }
}

// Context
class Parcel {
  ParcelState _parcelState = ConfirmationOfDispatch();

  void setParcelState(ParcelState parcelState) {
    _showInfo();
    _parcelState = parcelState;
  }

  void _showInfo() {
    _parcelState.printParcelStatus(this);
  }
}