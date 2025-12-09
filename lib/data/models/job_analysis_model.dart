class JobAnalysisModel {
  final double matchPercentage;
  final List<String> strengths;
  final List<String> improvements;
  final List<String> missingSkills;
  final String summary;
  final String jobContent;

  JobAnalysisModel({
    required this.matchPercentage,
    required this.strengths,
    required this.improvements,
    required this.missingSkills,
    required this.summary,
    required this.jobContent,
  });

  factory JobAnalysisModel.fromJson(Map<String, dynamic> json) {
    final analysis = json['analysis'] as Map<String, dynamic>;
    return JobAnalysisModel(
      matchPercentage: (analysis['match_percentage'] as num).toDouble(),
      strengths: List<String>.from(analysis['strengths'] ?? []),
      improvements: List<String>.from(analysis['improvements'] ?? []),
      missingSkills: List<String>.from(analysis['missing_skills'] ?? []),
      summary: analysis['summary'] ?? '',
      jobContent: json['job_content'] ?? '',
    );
  }
}
