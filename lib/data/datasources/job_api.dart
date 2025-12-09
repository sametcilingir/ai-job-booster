import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';
import '../models/job_analysis_model.dart';
import '../models/cover_letter_model.dart';

class JobApi {
  final String baseUrl = ApiConstants.baseUrl;

  Future<JobAnalysisModel> analyzeJob({
    required String cvContent,
    required String jobPostingUrl,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl${ApiConstants.analyzeJobEndpoint}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'cv_content': cvContent, 'job_posting_url': jobPostingUrl}),
      );

      if (response.statusCode == 200) {
        return JobAnalysisModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to analyze job: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error analyzing job: $e');
    }
  }

  Future<CoverLetterModel> generateCoverLetter({
    required String cvContent,
    required String jobPostingContent,
    required double matchPercentage,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl${ApiConstants.generateCoverLetterEndpoint}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'cv_content': cvContent,
          'job_posting_content': jobPostingContent,
          'match_percentage': matchPercentage,
        }),
      );

      if (response.statusCode == 200) {
        return CoverLetterModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to generate cover letter: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error generating cover letter: $e');
    }
  }

  Future<String> fetchJobPosting(String url) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl${ApiConstants.fetchJobPostingEndpoint}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'url': url}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['content'] ?? '';
      } else {
        throw Exception('Failed to fetch job posting: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching job posting: $e');
    }
  }
}
