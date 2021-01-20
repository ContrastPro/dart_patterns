void stateInContext() {
  final Order iphone7 = Order();

  print("\n*** Заказчик произвёл оплату ***");
  iphone7.changeOrderState(OrderStatus.SHIPMENT);
  print("\n*** Передано международному перевозчику ***");
  iphone7.changeOrderState(OrderStatus.LEFT_COUNTRY);
  print("\n*** Посылка находиться на сортировочном пункте ***");
  iphone7.changeOrderState(OrderStatus.ARRIVED_COUNTRY);
  print("\n*** Курьер Новой доставил посылку ***");
  iphone7.changeOrderState(OrderStatus.DELIVERED);
}

enum OrderStatus { SHIPMENT, LEFT_COUNTRY, ARRIVED_COUNTRY, DELIVERED }

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

  void changeOrderState(OrderStatus orderStatus) {
    switch (orderStatus) {
      case OrderStatus.SHIPMENT:
        _showInfo();
        _setOrderState(LeftCountry());
        break;
      case OrderStatus.LEFT_COUNTRY:
        _showInfo();
        _setOrderState(ArrivedInCountry());
        break;
      case OrderStatus.ARRIVED_COUNTRY:
        _showInfo();
        _setOrderState(Delivered());
        break;
      case OrderStatus.DELIVERED:
        // Можно вывести подробную историю доставки
        _showInfo();
        break;
    }
  }

  void _setOrderState(OrderState parcelState) {
    _orderState = parcelState;
  }

  void _showInfo() {
    _orderState.printOrderStatus();
  }
}
