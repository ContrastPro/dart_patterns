void stateInContext() {
  final Order iphone7 = Order();
  print("\n*** Заказчик произвёл оплату ***");
  iphone7.changeOrderState();
  print("\n*** Передано международному перевозчику ***");
  iphone7.changeOrderState();
  print("\n*** Посылка находиться на сортировочном пункте ***");
  iphone7.changeOrderState();
  print("\n*** Курьер Новой доставил посылку ***");
  iphone7.changeOrderState();
}

// State
abstract class OrderState {
  void printOrderStatus();
}

class ConfirmationOfDispatch implements OrderState {
  @override
  void printOrderStatus() {
    print("[01.01.21] Оплата произведена, ожидание передачи перевозчику");
  }
}

class LeftCountry implements OrderState {
  @override
  void printOrderStatus() {
    print("[03.01.21] Заказ покинул страну отправителя");
  }
}

class ArrivedInCountry implements OrderState {
  @override
  void printOrderStatus() {
    print("[10.01.21] Заказ прибыл в страну назначения");
  }
}

class Delivered implements OrderState {
  @override
  void printOrderStatus() {
    print("[22.01.21] Заказ выполнен");
  }
}

// Context
class Order {
  OrderState _orderState = ConfirmationOfDispatch();

  void changeOrderState() {
    _showInfo();
    if (_orderState is ConfirmationOfDispatch) {
      _setOrderState(LeftCountry());
    } else if (_orderState is LeftCountry) {
      _setOrderState(ArrivedInCountry());
    } else if (_orderState is ArrivedInCountry) {
      _setOrderState(Delivered());
    }
  }

  void _setOrderState(OrderState parcelState) {
    _orderState = parcelState;
  }

  void _showInfo() {
    _orderState.printOrderStatus();
  }
}
