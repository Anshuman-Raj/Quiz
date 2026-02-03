import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final String imagePath;
  final String welcomeText;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  const StartScreen({super.key,
  this.imagePath = 'assets/images/quiz-logo.png',
  this.welcomeText = 'Welcome to the Quiz App',
  this.buttonText = 'Start Quiz',
  this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          width: 300,
          color: Colors.white.withValues(alpha: 0.6),
          image: AssetImage(imagePath) ,
        ),
        SizedBox(height: 40),
        Text(
          welcomeText,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 20),
       OutlinedButton.icon(
          onPressed: onButtonPressed ?? () {
            // Define button action here
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.white, width: 2),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            foregroundColor: Colors.white
          ),
          icon: Icon(Icons.arrow_forward),
          label: Text(buttonText),
        ),
      ],
    );
  }
}