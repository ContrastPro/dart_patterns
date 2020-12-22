void main() => _dartComposite();

void _dartComposite() {
  final largeGiftBox = GiftBox()
    ..addItem(Item(price: 33.65, weight: 3.3))
    ..addItem(Item(price: 14.97, weight: 4.5))
    ..addItem(Item(price: 5.95, weight: 2.7));

  final smallGiftBox = GiftBox()..addItem(Item(price: 12.68, weight: 2.7));

  largeGiftBox.addItem(smallGiftBox);

  print("Price: ${largeGiftBox.price}");
  print("Weight: ${largeGiftBox.weight}");
}

class Item {
  final double price;
  final double weight;

  const Item({this.price, this.weight});
}

class GiftBox implements Item {
  final List<Item> items = [];

  void addItem(Item item) => items.add(item);

  @override
  double get price =>
      items.fold(0, (double sum, Item item) => sum + item.price);

  @override
  double get weight =>
      items.fold(0, (double sum, Item item) => sum + item.weight);
}
