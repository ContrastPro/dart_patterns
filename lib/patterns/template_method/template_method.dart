void main() {
  final DataReadingAlgorithm fileReader = FileReader();
  fileReader.readData();

  final DataReadingAlgorithm bufferReader = BufferReader();
  bufferReader.readData();

  final DataReadingAlgorithm databaseReader = DatabaseReader();
  databaseReader.readData();
}

class DataReadingAlgorithm {
  void openResource() {}

  static void extractData() {
    print("Extracting data...");
  }

  static void parseData() {
    print("Parsing data...");
  }

  static void processData() {
    print("Processing data...");
  }

  void closeResource() {}

  void readData() {
    openResource();
    extractData();
    parseData();
    processData();
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
