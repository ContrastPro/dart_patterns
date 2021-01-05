void builderBad() {
  /// BAD EXAMPLE
  final Pizza pizza = Pizza(
    PizzaSize.M,
    PizzaCrust.classic,
    PizzaSauce.marinara,
    ['pepperoni, olives'],
    false,
    false,
    null,
  );

  //     pizza.toMap();
  //
  //     'size': size, // M
  //     'crust': crust, // classic
  //     'notes': notes // null

  print(pizza);
}

enum PizzaSize { S, M, L, XL }

enum PizzaSauce { none, marinara, garlic }

enum PizzaCrust { classic, deepDish }

class Pizza {
  PizzaSize _size;
  PizzaCrust _crust;
  PizzaSauce _sauce;
  List<String> _toppings;
  bool _hasExtraCheese;
  bool _hasDoubleMeat;
  String _notes;

  Pizza(
    this._size,
    this._crust,
    this._sauce,
    this._toppings,
    this._hasExtraCheese,
    this._hasDoubleMeat,
    this._notes,
  );

  @override
  String toString() {
    return 'Pizza{size: $_size, '
        'crust: $_crust, '
        'sauce: $_sauce, '
        'toppings: $_toppings, '
        'hasExtraCheese: $_hasExtraCheese, '
        'hasDoubleMeat: $_hasDoubleMeat, '
        'notes: $_notes}';
  }
}
