void main() {
  final DataReadingAlgorithm fileReader = FileReader();
  fileReader.readData();

  final DataReadingAlgorithm bufferReader = BufferReader();
  bufferReader.readData();

  final DataReadingAlgorithm databaseReader = DatabaseReader();
  databaseReader.readData();
}

abstract class DataReadingAlgorithm {
  void openResource();

  void _extractData() {
    print("Extracting data...");
  }

  void _parseData() {
    print("Parsing data...");
  }

  void _processData() {
    print("Processing data...");
  }

  void closeResource();

  void readData() {
    openResource();
    _extractData();
    _parseData();
    _processData();
    closeResource();
  }
}

class FileReader extends DataReadingAlgorithm {
  @override
  void openResource() {
    print("Open File");
  }

  @override
  void closeResource() {
    print("Close File\n");
  }
}

class BufferReader extends DataReadingAlgorithm {
  @override
  void openResource() {
    print("Open Buffer");
  }

  @override
  void closeResource() {
    print("Close Buffer\n");
  }
}

class DatabaseReader extends DataReadingAlgorithm {
  @override
  void openResource() {
    print("Open Database");
  }

  @override
  void closeResource() {
    print("Close Database\n");
  }
}
