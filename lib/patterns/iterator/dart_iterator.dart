void dartIterator() {
  final DestinationList destinationList = DestinationList(
    list: [
      Destination(name: 'Destination 1'),
      Destination(name: 'Destination 2'),
      Destination(name: 'Destination 3'),
    ],
  );

  final DestinationIterator iterator =
      DestinationIterator(list: destinationList);

  final DestinationIterator2 iterator2 =
      DestinationIterator2(list: destinationList);

  while (iterator.moveNext()) {
    print(iterator.current.name);
  }
  print('\n');
  while (iterator2.moveNext()) {
    print(iterator2.current.name);
  }
}

class Destination {
  final String _name;

  String get name => _name;

  const Destination({String name}) : _name = name;
}

class DestinationList {
  final List<Destination> _destinations;

  List<Destination> get destinations => _destinations;

  const DestinationList({List<Destination> list}) : _destinations = list;
}

class DestinationIterator implements Iterator {
  final List<Destination> _destinations;
  int _index = 0;

  DestinationIterator({DestinationList list})
      : _destinations = list.destinations;

  @override
  bool moveNext() {
    return _index < _destinations.length;
  }

  @override
  Destination get current => _destinations[_index++];
}

class DestinationIterator2 implements Iterator {
  final List<Destination> _destinations;
  int _index = 0;

  DestinationIterator2({DestinationList list})
      : _destinations = list.destinations,
        _index = list.destinations.length - 1;

  @override
  bool moveNext() {
    return _index >= 0;
  }

  @override
  Destination get current => _destinations[_index--];
}
