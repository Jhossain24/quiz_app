import 'dart:convert';
import 'package:http/http.dart' as http;
import 'question.dart';

class ApiService {
  final String baseUrl = 'https://opentdb.com/api.php';

  Future<List<Question>> fetchQuestions() async {
    try {
      String url =
          '$baseUrl?amount=10&category=9&difficulty=easy&type=multiple';

      final response = await http.get(Uri.parse(url));

      // request was successful to be checked
      if (response.statusCode == 200) {
        // Parse JSON
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> results = data['results'];

        // cnvert each result to question object
        List<Question> questions = results
            .map((item) => Question.fromJson(item))
            .toList();

        return questions;
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
