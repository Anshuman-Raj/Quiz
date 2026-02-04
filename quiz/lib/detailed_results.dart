import 'package:flutter/material.dart';

class DetailedResults extends StatelessWidget {
  final String question;
  final String yourAnswer;
  final String correct;

  const DetailedResults({
    super.key,
    required this.question,
    required this.yourAnswer,
    required this.correct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: yourAnswer == correct ? Colors.green : Colors.red,
                child: Icon(
                  yourAnswer == correct ? Icons.check : Icons.close,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              // Take remaining horizontal space so Text can wrap
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Q: $question',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Your Answer: $yourAnswer',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Correct Answer: $correct',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}