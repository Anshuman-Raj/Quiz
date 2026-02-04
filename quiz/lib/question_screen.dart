import 'package:flutter/material.dart';
import 'package:quiz/result_screen.dart';

class QuestionScreen extends StatefulWidget {


  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  final List<String> questions = [
      'What is the capital of France?',
      'What is 2 + 2?',
      'What is the largest planet in our solar system?',
    ];

  final List<List<String>> answers = [
      ['Paris', 'London', 'Berlin', 'Madrid'],
      ['3', '4', '5', '6'],
      ['Earth', 'Mars', 'Jupiter', 'Saturn'],
    ];
  
  final List<String> correctAnswers = [
    'Paris',
    '4',
    'Jupiter',
  ];
  var score = 0;

  List<Map<String, String>> selectedAnswers = [];

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= questions.length) {
      // Quiz is over, show results
      return ResultScreen(score: score, totalQuestions: questions.length, selectedAnswers: selectedAnswers, onRestartQuiz: () {
        setState(() {
          currentQuestionIndex = 0;
          score = 0;
          selectedAnswers = [];
        });
      });
    }
    else{
    List<Widget> children = [
      Text(
        'This is the Question Screen',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 20),
      // Additional widgets for questions and answers can be added here
    ];

    

    List<Widget> answerButtons = answers[currentQuestionIndex].map((option) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: OutlinedButton(
            onPressed: () {
              // Handle answer selection
              if (option == correctAnswers[currentQuestionIndex]) {
                score++;
              }
              selectedAnswers.add({
                'question': questions[currentQuestionIndex],
                'answer': option,
                'correct': correctAnswers[currentQuestionIndex],
              });
              setState(() {
                currentQuestionIndex++;
              });
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 2),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              foregroundColor: Colors.white,
            ),
            child: Text(option),
          ),
        ),
      );
    }).toList();
    children.add(
      Text(
        questions[currentQuestionIndex],
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
    children.add(SizedBox(height: 10));
    children.addAll(answerButtons);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
  }
}
