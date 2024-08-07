import 'package:http/http.dart' as http;

class GithubApiService {
  final String baseUrl = 'https://api.github.com/search/repositories';

  Future<http.Response?> fetchRepositories(String date) async {
    http.Response? response;
    try {
      response = await http.get(
          Uri.parse('$baseUrl?q=created:>2022-04-29&sort=stars&order=desc'));
    } catch (ex) {
      rethrow;
    }
    return response;
  }
}
