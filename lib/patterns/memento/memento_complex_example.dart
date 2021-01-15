import 'dart:io';

import 'commit_hash.dart';

void mementoComplexExample() {
  DartPatterns dartPatterns = DartPatterns();
  GitHub github = GitHub();

  // Добавляем какие-то изменения в проект
  dartPatterns..addFile("singleton.dart")..addFile("prototype.dart");

  print("\n*** Initial commit ***\n");
  github.pushProject(dartPatterns.commit());
  print(dartPatterns);

  // Добавляем какие-то изменения в проект
  dartPatterns..addFile("builder.dart")..addFile("factory_method.dart");

  print("\n*** Second commit ***\n");
  github.pushProject(dartPatterns.commit());
  print(dartPatterns);

  // Добавляем какие-то изменения в проект
  dartPatterns..addFile("command.dart")..addFile("memento.dart");

  print("\n*** Third commit ***\n");
  github.pushProject(dartPatterns.commit());
  print(dartPatterns);

  print("\n*** Reset Current Branch to Commit ***\n> git checkout ");

  String commitHash = stdin.readLineSync();
  dartPatterns.updateProject(github.resetCurrentBrunchTo(commitHash));
  print("\n$dartPatterns");
}

class DartPatterns {
  String _commitHash;
  List<String> _filesList = List<String>();

  void addFile(String file) {
    _filesList.add(file);
  }

  Commit commit() {
    _commitHash = CommitHash.getHash();
    return Commit(fileList: _filesList, version: _commitHash);
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

class Commit {
  String _commitHash;
  List<String> _fileList = List<String>();

  String get commitHash => _commitHash;

  List<String> get fileList => _fileList;

  Commit({List<String> fileList, String version}) {
    _fileList.addAll(fileList);
    this._commitHash = version;
  }
}

class GitHub {
  List<Commit> _commitHistory = List<Commit>();

  Commit resetCurrentBrunchTo(String commitHash) {
    return _commitHistory
        .firstWhere((element) => element.commitHash == commitHash);
  }

  void pushProject(Commit commit) {
    _commitHistory.add(commit);
  }
}
