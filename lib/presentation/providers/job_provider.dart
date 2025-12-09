import 'package:flutter/foundation.dart';
import '../../data/repositories/job_repository.dart';
import '../../data/models/job_analysis_model.dart';
import '../../data/models/cover_letter_model.dart';

class JobProvider with ChangeNotifier {
  final JobRepository _repository;

  JobProvider({JobRepository? repository}) : _repository = repository ?? JobRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  JobAnalysisModel? _analysis;
  JobAnalysisModel? get analysis => _analysis;

  CoverLetterModel? _coverLetter;
  CoverLetterModel? get coverLetter => _coverLetter;

  String _lastCvContent = '';
  String _lastJobContent = '';

  String? _error;
  String? get error => _error;
  String get lastCvContent => _lastCvContent;
  String get lastJobContent => _lastJobContent;

  Future<void> analyzeJob({
    required String cvContent,
    required String jobPostingUrl,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _analysis = await _repository.analyzeJob(
        cvContent: cvContent,
        jobPostingUrl: jobPostingUrl,
      );
      _lastCvContent = cvContent;
      _lastJobContent = _analysis?.jobContent ?? '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> generateCoverLetter({
    required String cvContent,
    required String jobPostingContent,
    required double matchPercentage,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _coverLetter = await _repository.generateCoverLetter(
        cvContent: cvContent.isNotEmpty ? cvContent : _lastCvContent,
        jobPostingContent: jobPostingContent.isNotEmpty
            ? jobPostingContent
            : _lastJobContent,
        matchPercentage: matchPercentage,
      );
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearAnalysis() {
    _analysis = null;
    _coverLetter = null;
    _error = null;
    notifyListeners();
  }
}
