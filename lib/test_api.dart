import 'api_service.dart';

void main() async {
  print('Testing API connection...');
  ApiService api = ApiService();

  try {
    var questions = await api.fetchQuestions();
    print('Success! Got ${questions.length} questions');
    print('First question: ${questions[0].questionText}');
    print('Answers: ${questions[0].allAnswers}');
  } catch (e) {
    print('Error: $e');
  }
}
