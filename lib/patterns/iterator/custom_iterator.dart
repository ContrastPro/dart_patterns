void customIterator() {
  final IterableCollection destinationList = DestinationList(
    list: [
      'Destination 1',
      'Destination 2',
      'Destination 3',
      'Destination 4',
      'Destination 5',
    ],
  );

  print("\n*** Descending iteration ***\n");
  final Iterator iterator = destinationList.getIterator();

  while (iterator.moveNext()) {
    print(iterator.current);
  }
}

abstract class Iterator {
  bool moveNext();

  dynamic get current;
}

// Iterable collection
abstract class IterableCollection {
  Iterator getIterator();
}

// Concrete collection
class DestinationList implements IterableCollection {
  final List<String> _destinations;

  const DestinationList({List<String> list}) : _destinations = list;

  @override
  Iterator getIterator() {
    return DownwardIterator(list: _destinations);
  }
}

// Concrete iterator
class DownwardIterator implements Iterator {
  final List<String> _destinations;
  int _index = 0;

  DownwardIterator({List<String> list}) : _destinations = list;

  @override
  bool moveNext() {
    return _index < _destinations.length;
  }

  @override
  String get current => _destinations[_index++];
}
