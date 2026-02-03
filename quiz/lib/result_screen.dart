import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final List<Map<String, String>> selectedAnswers;
  final VoidCallback onRestartQuiz;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.selectedAnswers,
    required this.onRestartQuiz,
  });

  @override
  Widget build(BuildContext context) {
    Widget restartButton = OutlinedButton.icon(
          onPressed: onRestartQuiz,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.white, width: 2),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            foregroundColor: Colors.white
          ),
          icon: Icon(Icons.restart_alt),
          label: Text('Restart Quiz'),
        );

    List<Widget> children = [
        Text(
          'Your Score: $score / $totalQuestions',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 20),
        
      ];
    
    for (var entry in selectedAnswers) {
      final question = entry['question'] ?? 'Unknown question';
      final yourAnswer = entry['answer'] ?? 'No answer';
      final correct = entry['correct'] ?? 'N/A';
      children.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            'Q: $question\nYour Answer: $yourAnswer\nCorrect Answer: $correct',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      );
    }
    children.add(SizedBox(height: 30));
    children.add(restartButton);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
