import '../datasources/job_api.dart';
import '../models/job_analysis_model.dart';
import '../models/cover_letter_model.dart';

class JobRepository {
  JobRepository({JobApi? api}) : _api = api ?? JobApi();

  final JobApi _api;

  Future<JobAnalysisModel> analyzeJob({
    required String cvContent,
    required String jobPostingUrl,
  }) {
    return _api.analyzeJob(cvContent: cvContent, jobPostingUrl: jobPostingUrl);
  }

  Future<CoverLetterModel> generateCoverLetter({
    required String cvContent,
    required String jobPostingContent,
    required double matchPercentage,
  }) {
    return _api.generateCoverLetter(
      cvContent: cvContent,
      jobPostingContent: jobPostingContent,
      matchPercentage: matchPercentage,
    );
  }

  Future<String> fetchJobPosting(String url) {
    return _api.fetchJobPosting(url);
  }
}
