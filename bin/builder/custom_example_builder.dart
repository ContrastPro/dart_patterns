void customBuilder() {
  final PizzaPepperoni pepperoni = PizzaPepperoni();

  Director.buildPizza(pepperoni);

  final Pizza pizza = pepperoni.getPizzaPeperoni();

  print(pizza);
}

enum PizzaSize { S, M, L, XL }

enum PizzaCrust { classic, deepDish }

enum PizzaSauce { none, marinara, garlic }

class Director {
  static void buildPizza(PizzaBuilder builder) {
    builder.createPizza();
    builder.buildSize();
    builder.buildCrust();
    builder.buildSouse();
  }
}

abstract class PizzaBuilder {
  void createPizza();

  void buildSize();

  void buildCrust();

  void buildSouse();
}

class PizzaPepperoni extends PizzaBuilder {
  Pizza _pizza;

  @override
  void createPizza() => _pizza = Pizza();

  @override
  void buildSize() => _pizza.size = PizzaSize.M;

  @override
  void buildCrust() => _pizza.crust = PizzaCrust.classic;

  @override
  void buildSouse() => _pizza.sauce = PizzaSauce.garlic;

  Pizza getPizzaPeperoni() => _pizza;
}

class PizzaMarinara extends PizzaBuilder {
  Pizza _pizza;

  @override
  void createPizza() => _pizza = Pizza();

  @override
  void buildSize() => _pizza.size = PizzaSize.XL;

  @override
  void buildCrust() => _pizza.crust = PizzaCrust.deepDish;

  @override
  void buildSouse() => _pizza.sauce = PizzaSauce.marinara;

  Pizza getPizzaMarinara() => _pizza;
}

class Pizza {
  PizzaSize _size;
  PizzaCrust _crust;
  PizzaSauce _sauce;

  set size(PizzaSize value) => _size = value;

  set crust(PizzaCrust value) => _crust = value;

  set sauce(PizzaSauce value) => _sauce = value;

  @override
  String toString() {
    return 'Pizza{size: $_size, '
        'crust: $_crust, '
        'sauce: $_sauce, }';
  }
}
