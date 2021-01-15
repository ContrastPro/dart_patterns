import 'dart:math';

class CommitHash {
  static const CHARS = '1a2b3c4d5e6f7g8h9i0';

  static String getHash() {
    return String.fromCharCodes(
      Iterable.generate(
        7,
        (_) => CHARS.codeUnitAt(Random().nextInt(CHARS.length)),
      ),
    );
  }
}
