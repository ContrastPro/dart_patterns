/**
 *
 * ## The essence of the pattern.
 *
 * * A compositor is a structural design pattern that allows you to group multiple
 *   objects into a tree structure and then work with it as if it were a single object.
 *
 *
 * ## Analogy from life.
 *
 * * The armies of most states can be represented as inverted trees. At the bottom level,
 *   you have soldiers, then platoons, then regiments, and then whole armies. Orders are given
 *   from above and descend down the command structure until they reach a specific soldier.
 *
 *
 * ## Applicability.
 *
 * * When you need to imagine a tree structure of objects.
 *
 *   The Linker pattern suggests storing references to other simple or complex objects
 *   in composite objects. Those, in turn, can also store their nested objects, and so on.
 *   As a result, you can build a complex tree-like data structure using just two main
 *   types of objects.
 *
 * * When clients need to treat simple and complex objects in a consistent way.
 *   Due to the fact that simple and composite objects implement a common interface,
 *   the client does not care which object he has to work with.
 *
 *
 * ## Implementation steps:
 *
 * (1) Make sure your business logic can be viewed as a tree structure. Try to break it down
 *     into simple components and containers. Remember that containers can contain both simple
 *     components and other nested containers.
 *
 * (2) Create a common component interface that combines the operations of containers and
 *     simple tree components. An interface is great if you can use it to interchange simple and
 *     composite components without losing meaning.
 */
class Item {
  final double price;
  final double weight;

  const Item({this.price, this.weight});
}
/**
 * (3) Create a container component class and add an array to it to store references to nested
 *     components. This array must be able to contain both simple and composite components,
 *     so make sure it is declared with the component interface type.
 *
 * The GiftBox class implements the implicit interface exported by Item, which means
 * GiftBox must provide implementations of the price and weight getters from the Item class.
 * Dart creates implicit getters and setters for every variable and property that doesn't have
 * explicit accessors defined. In the case of final properties, no implicit setter is created,
 * as these properties are protected from reassignment after initialization.
 */
class GiftBox implements Item {
  final List<Item> items = [];

  void addItem(Item item) => items.add(item);

  /**
   * Use the List class's fold() method to return the total price and weight of all
   * items within the container, as containers don't have those attributes themselves.
   */
  @override
  double get price =>
      items.fold(0, (double sum, Item item) => sum + item.price);

  @override
  double get weight =>
      items.fold(0, (double sum, Item item) => sum + item.weight);
}
