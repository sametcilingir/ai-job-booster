class ApiConstants {
  // For Android emulator use 10.0.2.2. For iOS simulator use 127.0.0.1.
  // If testing on a real device, set this to your machine's LAN IP.
  static const String baseUrl = 'http://10.0.2.2:8000';
  static const String analyzeJobEndpoint = '/api/analyze-job';
  static const String generateCoverLetterEndpoint = '/api/generate-cover-letter';
  static const String fetchJobPostingEndpoint = '/api/fetch-job-posting';
}
