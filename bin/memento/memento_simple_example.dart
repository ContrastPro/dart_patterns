import 'commit_hash.dart';

void mementoSimpleExample() {
  DartPatterns dartPatterns = DartPatterns();
  GitHub github = GitHub();

  // Добавляем какие-то изменения в проект
  dartPatterns..addFile("singleton.dart")..addFile("prototype.dart");

  print("\n*** Initial commit ***\n");
  github.pushProject(dartPatterns.commit());
  print(dartPatterns);

  // Добавляем какие-то изменения в проект
  dartPatterns..addFile("builder.dart")..addFile("factory_method.dart");

  print("\n*** Project files was modified ***\n");
  print(dartPatterns);

  // Нам не нравяться изменения, поэтому откатываем проект к последнему комиту
  print("\n*** Update project to last commit ***\n");
  dartPatterns.updateProject(github.getProject());
  print(dartPatterns);
}

// Originator Создатель
class DartPatterns {
  String _commitHash;
  List<String> _filesList = List<String>();

  void addFile(String file) {
    _filesList.add(file);
  }

  Commit commit() {
    _commitHash = CommitHash.getHash();
    return Commit(fileList: _filesList, commitHash: _commitHash);
  }

  void updateProject(Commit commit) {
    _commitHash = commit.commitHash;
    _filesList = commit.fileList;
  }

  @override
  String toString() {
    return 'DartPatterns:'
        '\nCommit hash: <$_commitHash>'
        '\nProject files: $_filesList';
  }
}

// Memento Хранитель
class Commit {
  String _commitHash;
  List<String> _fileList = List<String>();

  String get commitHash => _commitHash;

  List<String> get fileList => _fileList;

  Commit({List<String> fileList, String commitHash}) {
    _fileList.addAll(fileList);
    this._commitHash = commitHash;
  }
}

// Caretaker Опекун
class GitHub {
  Commit _commit;

  Commit getProject() {
    return _commit;
  }

  void pushProject(Commit commit) {
    _commit = commit;
  }
}
