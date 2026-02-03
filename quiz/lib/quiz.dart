import 'package:flutter/material.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/gradient_container.dart';
import 'package:quiz/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? _screenChild;
  
  void _startQuiz() {
    // Logic to start the quiz can be added here
    setState(() {
      // Update state to show question screen
      _screenChild = QuestionScreen(restartQuiz: _restartQuiz);
    });
  }

  // void _answerQuestion() {
  //   // Logic to handle answering a question can be added here
  // }

  void _restartQuiz() {
    // Logic to restart the quiz can be added here
    setState(() {
      _screenChild = null;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    Widget screenChild = _screenChild ?? StartScreen(
            imagePath: "assets/images/quiz-logo.png",
            welcomeText: "Welcome to the Quiz App",
            buttonText: "Start Quiz",
            onButtonPressed: _startQuiz,
          );
    GradientContainer myContainer = GradientContainer(
        colors: [
                Color.fromARGB(255, 142, 64, 251),
                Color.fromARGB(255, 64, 89, 251)
              ],
        child: Center(
            child: Center(
          child: screenChild,
        ),
          ),
        );
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: myContainer,
      ),
    );
  }
  }
