void dartIterator() {
  final DestinationList destinationList = DestinationList(
    list: [
      'Destination 1',
      'Destination 2',
      'Destination 3',
      'Destination 4',
      'Destination 5',
    ],
  );

  print("\n*** Descending iteration ***\n");
  final DownwardIteration downwardIteration =
      DownwardIteration(list: destinationList);

  while (downwardIteration.moveNext()) {
    print(downwardIteration.current);
  }

  print("\n*** Ascending iteration ***\n");
  final AscendingIteration ascendingIteration =
      AscendingIteration(list: destinationList);

  while (ascendingIteration.moveNext()) {
    print(ascendingIteration.current);
  }
}

class DestinationList {
  final List<String> _destinations;

  List<String> get destinations => _destinations;

  const DestinationList({List<String> list}) : _destinations = list;
}

class DownwardIteration implements Iterator {
  final List<String> _destinations;
  int _index = 0;

  DownwardIteration({DestinationList list}) : _destinations = list.destinations;

  @override
  bool moveNext() {
    return _index < _destinations.length;
  }

  @override
  String get current => _destinations[_index++];
}

class AscendingIteration implements Iterator {
  final List<String> _destinations;
  int _index;

  AscendingIteration({DestinationList list})
      : _destinations = list.destinations,
        _index = list.destinations.length - 1;

  @override
  bool moveNext() {
    return _index >= 0;
  }

  @override
  String get current => _destinations[_index--];
}
