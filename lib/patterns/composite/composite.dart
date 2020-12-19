/**
 *
 * ## The essence of the pattern.
 *
 * * Composite is a structural design pattern that lets you compose objects
 *   into tree structures and then work with these structures as if they were
 *   individual objects.
 *
 *
 * ## Analogy from life.
 *
 * * Armies of most countries are structured as hierarchies. An army consists
 *   of several divisions; a division is a set of brigades, and a brigade
 *   consists of platoons, which can be broken down into squads.
 *
 *   Finally, a squad is a small group of real soldiers. Orders are given at
 *   the top of the hierarchy and passed down onto each level until every
 *   soldier knows what needs to be done.
 *
 *
 * ## Applicability.
 *
 * * Use the Composite pattern when you have to implement a tree-like object
 *   structure.
 *
 *   The Composite pattern provides you with two basic element types that share
 *   a common interface: simple leaves and complex containers. A container
 *   can be composed of both leaves and other containers. This lets you
 *   construct a nested recursive object structure that resembles a tree.
 *
 * * Use the pattern when you want the client code to treat both simple and
 *   complex elements uniformly.
 *
 *   All elements defined by the Composite pattern share a common interface.
 *   Using this interface, the client doesn’t have to worry about the concrete
 *   class of the objects it works with.
 *
 *
 * ## Implementation steps:
 *
 * (1) Make sure that the core model of your app can be represented as a tree
 *     structure. Try to break it down into simple elements and containers.
 *     Remember that containers must be able to contain both simple elements and
 *     other containers.
 *
 * (2) Declare the component interface with a list of methods that make sense
 *     for both simple and complex components. An interface is great if
 *     you can use it to interchange simple and composite components without
 *     losing meaning.
 */
class Item {
  final double price;
  final double weight;

  const Item({this.price, this.weight});
}

/**
 * (3) Create a container class to represent complex elements. In this class,
 *     provide an array field for storing references to sub-elements.
 *     The array must be able to store both leaves and containers, so make sure
 *     it’s declared with the component interface type.
 *
 * The GiftBox class implements the implicit interface exported by Item,
 * which means GiftBox must provide implementations of the price and weight
 * getters from the Item class.
 *
 * Dart creates implicit getters and setters for every variable and property
 * that doesn't have explicit accessors defined. In the case of final
 * properties, no implicit setter is created, as these properties are protected
 * from reassignment after initialization.
 */
class GiftBox implements Item {
  final List<Item> items = [];

  void addItem(Item item) => items.add(item);

  /**
   * Use the List class's fold() method to return the total price and weight of
   * all items within the container, as containers don't have those attributes
   * themselves.
   */
  @override
  double get price =>
      items.fold(0, (double sum, Item item) => sum + item.price);

  @override
  double get weight =>
      items.fold(0, (double sum, Item item) => sum + item.weight);
}
