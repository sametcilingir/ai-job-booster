class CoverLetterModel {
  final String coverLetter;

  CoverLetterModel({required this.coverLetter});

  factory CoverLetterModel.fromJson(Map<String, dynamic> json) {
    return CoverLetterModel(coverLetter: json['cover_letter'] ?? '');
  }
}
