class Question {
  final String questionText;
  final String correctAnswer;
  final List<String> allAnswers;

  Question({
    required this.questionText,
    required this.correctAnswer,
    required this.allAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    List<String> incorrect = List<String>.from(json['incorrect_answers']);

    // Create all answers list
    List<String> allAnswers = List.from(incorrect);
    allAnswers.add(json['correct_answer']);

    allAnswers.shuffle();

    return Question(
      questionText: json['question'],
      correctAnswer: json['correct_answer'],
      allAnswers: allAnswers,
    );
  }
}
