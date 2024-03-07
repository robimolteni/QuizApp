import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/questions_screen.dart';
import 'package:quiz_app_flutter/result_screen.dart';
import 'package:quiz_app_flutter/start_screen.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/temporary_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'showtoast-screen';
    });
  }

  void showToastHere() {
    print("I've pressed show toast");
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if(selectedAnswer.length == questions.length) {
      //I back to start screen
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = "questions-screen";
    });
  }

  Widget build(contex) {
    //rimango sempre nello stesso contesto senza cambiare
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'showtoast-screen') {
      screenWidget = TemporaryWidget(showToastHere);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
          chosenAnswers: selectedAnswer,
          onRestart: restartQuiz,
      );
    }

    return MaterialApp(
        home: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 78, 13, 151),
                        Color.fromARGB(255, 107, 15, 168),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                ),
                child: screenWidget,
            )
        )
    );
  }
}