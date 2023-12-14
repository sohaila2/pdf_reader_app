
class PDFFile {
  final String path;
  bool isFavorite;

  PDFFile({
    required this.path,
    this.isFavorite = false,
  });

  String get name => path.split('/').last;

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'isFavorite': isFavorite,
    };
  }

  factory PDFFile.fromJson(Map<String, dynamic> json) {
    return PDFFile(
      path: json['path'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}