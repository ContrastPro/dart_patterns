void builderBest() {
  final Pizza pizza = Pizza(size: PizzaSize.L);
  print(pizza);

  final Pizza pizza1 = pizza.copyWith(crust: PizzaCrust.classic);
  print(pizza1);
}

enum PizzaSize { S, M, L, XL }

enum PizzaSauce { none, marinara, garlic }

enum PizzaCrust { classic, deepDish }

class Pizza {
  final PizzaSize size;
  final PizzaCrust crust;
  final PizzaSauce sauce;
  final List<String> toppings;
  final bool hasExtraCheese;
  final bool hasDoubleMeat;
  final String notes;

  Pizza(
      {this.size,
      this.crust,
      this.sauce,
      this.toppings,
      this.hasExtraCheese = false,
      this.hasDoubleMeat = false,
      this.notes});

  Pizza copyWith(
      {PizzaSize size,
      PizzaCrust crust,
      PizzaSauce sauce,
      List<String> toppings,
      bool hasExtraCheese,
      bool hasDoubleMeat,
      String notes}) {
    return Pizza(
        size: size ?? this.size,
        crust: crust ?? this.crust,
        sauce: sauce ?? this.sauce,
        toppings: toppings ?? this.toppings,
        hasExtraCheese: hasExtraCheese ?? this.hasExtraCheese,
        hasDoubleMeat: hasDoubleMeat ?? this.hasDoubleMeat,
        notes: notes ?? this.notes);
  }

  @override
  String toString() {
    return 'Pizza{size: $size, '
        'crust: $crust, '
        'sauce: $sauce, '
        'toppings: $toppings, '
        'hasExtraCheese: $hasExtraCheese, '
        'hasDoubleMeat: $hasDoubleMeat, '
        'notes: $notes}';
  }
}
