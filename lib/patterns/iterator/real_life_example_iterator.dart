void realLifeExampleIterator() {
  final ProductList productList = ProductList(list: [
    Product(title: "Pineapple", price: 10.0),
    Product(title: "Apple", price: 20.0),
    Product(title: "Orange", price: 30.0),
    Product(title: "Banana", price: 40.0),
    Product(title: "Avocado", price: 50.0),
  ]);

  print("\n*** Descending iteration ***\n");
  final DownwardIteration downwardIteration =
      DownwardIteration(list: productList);

  while (downwardIteration.moveNext()) {
    print(downwardIteration.current.productInfo());
  }

  print("\n*** Ascending iteration ***\n");
  final AscendingIteration ascendingIteration =
      AscendingIteration(list: productList);

  while (ascendingIteration.moveNext()) {
    print(ascendingIteration.current.productInfo());
  }
}

class Product {
  final String _title;
  final double _price;

  String get title => _title;

  double get price => _price;

  const Product({String title, double price})
      : _title = title,
        _price = price;


  String productInfo() {
    return "--- ${title.toUpperCase()} ---\n"
        "Price: $price грн\n";
  }
}

class ProductList {
  final List<Product> _productList;

  List<Product> get productList => _productList;

  const ProductList({List<Product> list}) : _productList = list;
}

class DownwardIteration implements Iterator {
  final List<Product> _productList;
  int _index = 0;

  DownwardIteration({ProductList list}) : _productList = list.productList;

  @override
  bool moveNext() {
    return _index < _productList.length;
  }

  @override
  Product get current => _productList[_index++];
}

class AscendingIteration implements Iterator {
  final List<Product> _productList;
  int _index;

  AscendingIteration({ProductList list})
      : _productList = list.productList,
        _index = list.productList.length - 1;

  @override
  bool moveNext() {
    return _index >= 0;
  }

  @override
  Product get current => _productList[_index--];
}
