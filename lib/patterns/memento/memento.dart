void main() {
  final DartPatterns dartPatterns = DartPatterns();

  dartPatterns
    ..addFile("singleton.dart")
    ..addFile("prototype.dart")
    ..addFile("builder.dart");
}

class DartPatterns {
  String _version;
  DateTime _date;
  List<String> _filesList = List<String>();

  void addFile(String file) {
    _filesList.add(file);
  }

  Commit commit(){
    return Commit(_version, _filesList);
  }

  void rollBack(Commit commit){
    _version = commit.version;
    _date = commit.date;
    _filesList = commit.filesList;
  }

  @override
  String toString() {
    return 'DartPatterns:'
        '\nversion: $_version,'
        '\ndate: $_date,'
        '\nfilesList: $_filesList';
  }
}

class Commit {
  final String _version;
  final DateTime _date;
  final List<String> _filesList;

  Commit(this._version, this._filesList) : _date = DateTime.now();

  String get version => _version;

  DateTime get date => _date;

  List<String> get filesList => _filesList;
}
