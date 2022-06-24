void visitorSecondExample() {
  List<Product> productList = [
    Phone("Iphone 7+", 350.0),
    Phone("Iphone 12", 799.0),
    Phone("Iphone 11", 699.0),
    Tablet("Windows Pro", 499.0),
    Laptop("Mac Air", 39000.0),
  ];

  final PricingVisitor pricingVisitor = PricingVisitor();
  final DiscountVisitor discountVisitor = DiscountVisitor();

  productList.forEach((element) {
    element.accept(pricingVisitor);
    element.accept(discountVisitor);
  });

  pricingVisitor.totalPrice();
  discountVisitor.totalPrice();
}

abstract class Product {
  final String _title;
  final double _price;

  String get title => _title;

  double get price => _price;

  Product(String title, double price)
      : this._title = title,
        this._price = price;

  void accept(Visitor visitor);
}

class Phone extends Product {
  Phone(String title, double price) : super(title, price);

  @override
  void accept(Visitor visitor) {
    visitor.visitMobile(this);
  }
}

class Tablet extends Product {
  final double tax = 1.1;

  Tablet(String title, double price) : super(title, price);

  @override
  void accept(Visitor visitor) {
    visitor.visitTablet(this);
  }
}

class Laptop extends Product {
  final double discount = 0.5;

  Laptop(String title, double price) : super(title, price);

  @override
  void accept(Visitor visitor) {
    visitor.visitLaptop(this);
  }
}

abstract class Visitor {
  void visitMobile(Phone phone);

  void visitTablet(Tablet tablet);

  void visitLaptop(Laptop laptop);
}

class PricingVisitor implements Visitor {
  double _totalPrice = 0;

  @override
  void visitLaptop(Laptop laptop) {
    _totalPrice += laptop.price;
  }

  @override
  void visitMobile(Phone phone) {
    _totalPrice += phone.price;
  }

  @override
  void visitTablet(Tablet tablet) {
    _totalPrice += tablet.price;
  }

  void totalPrice() {
    print("Total price: $_totalPrice");
  }
}

class DiscountVisitor implements Visitor {
  double _totalPrice = 0;

  @override
  void visitLaptop(Laptop laptop) {
    _totalPrice += laptop.price * laptop.discount;
  }

  @override
  void visitMobile(Phone phone) {
    _totalPrice += phone.price;
  }

  @override
  void visitTablet(Tablet tablet) {
    _totalPrice += tablet.price;
  }

  void totalPrice() {
    print("Discount price: $_totalPrice");
  }
}
