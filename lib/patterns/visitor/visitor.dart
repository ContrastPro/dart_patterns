import 'visitor_second_example.dart';

void main() {
  visitorSecondExample();

  /*final IFile word = Word("Report 1");
  final IFile excel = Excel("Spread Sheet 1");

  final DisplayExporter displayExporter = DisplayExporter();
  final PDFExporter pdfExporter = PDFExporter();

  word.accept(displayExporter);
  word.accept(pdfExporter);

  print("\n----------\n");

  excel.accept(displayExporter);
  excel.accept(pdfExporter);*/
}

abstract class IFile {
  void accept(Visitor visitor);
}

class Word implements IFile {
  String _title;
  List<String> _illustrations;

  String get title => _title;

  List<String> get illustrations => _illustrations;

  Word(String title, [List illustrations])
      : this._title = title,
        this._illustrations = [
          'image1.png',
          'image2.png',
        ];

  @override
  void accept(Visitor visitor) {
    visitor.visitReport(this);
  }
}

class Excel implements IFile {
  String _title;
  Map<int, String> _structure;

  String get title => _title;

  Map<int, String> get structure => _structure;

  Excel(String title, [Map<int, String> structure])
      : this._title = title,
        this._structure = {
          1: "Column 1",
          2: "Column 2",
        };

  @override
  void accept(Visitor visitor) {
    visitor.visitSpreadSheet(this);
  }
}

abstract class Visitor {
  void visitReport(Word report);

  void visitSpreadSheet(Excel spreadSheet);
}

class DisplayExporter implements Visitor {
  @override
  void visitReport(Word report) {
    print("Export report '${report.title}' to DISPLAY"
        "\n${report.illustrations}\n");
  }

  @override
  void visitSpreadSheet(Excel spreadSheet) {
    print("Export report '${spreadSheet.title}' to DISPLAY"
        "\n${spreadSheet.structure}\n");
  }
}

class PDFExporter implements Visitor {
  @override
  void visitReport(Word report) {
    print("Export report '${report.title}' to PDF"
        "\n${report.illustrations}\n");
  }

  @override
  void visitSpreadSheet(Excel spreadSheet) {
    print("Export report '${spreadSheet.title}' to PDF"
        "\n${spreadSheet.structure}\n");
  }
}