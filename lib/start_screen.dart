import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {

  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(content) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
                opacity:0.5,
                child: Image.asset(
                  'assets/images/quiz-logo.png',
                  width: 300,
                )
            ),
            SizedBox(height: 30),
            Text(
                "Lear Flutter in a fun way",
                style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 237, 223, 252),
                fontSize: 24,
              ),
            ),
            SizedBox(height: 30),
            OutlinedButton.icon(
                onPressed: startQuiz,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: Text("Start Quiz")
            ),
          ],
        )
    );
  }
}