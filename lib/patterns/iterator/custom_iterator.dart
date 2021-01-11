void customIterator() {
  final DestinationList destinationList = DestinationList(
    list: [
      Destination(name: 'Destination 1'),
      Destination(name: 'Destination 2'),
      Destination(name: 'Destination 3'),
    ],
  );

  final Iterator iterator = destinationList.getIterator();

  while (iterator.moveNext()) {
    print(iterator.current.name);
  }
}

abstract class Iterator {
  bool moveNext();

  get current;
}

// Iterable collection
abstract class IterableCollection {
  Iterator getIterator();
}

class Destination {
  final String _name;

  const Destination({String name}) : _name = name;
}

// Concrete collection
class DestinationList implements IterableCollection {
  final List<Destination> _destinations;

  const DestinationList({List<Destination> list}) : _destinations = list;

  @override
  Iterator getIterator() {
    return DestinationIterator(list: _destinations);
  }
}

// Concrete iterator
class DestinationIterator implements Iterator {
  final List<Destination> _destinations;
  int _index = 0;

  DestinationIterator({List<Destination> list}) : _destinations = list;

  @override
  bool moveNext() {
    return _index < _destinations.length;
  }

  @override
  Destination get current => _destinations[_index++];
}
