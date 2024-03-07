import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/answer_button.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/models/quiz_questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

/*class _QuestionScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return const Text("QuestionsScreen");
  }
}*/
class _QuestionScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {

    print("selected anwers is ${selectedAnswer}");

    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {

    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
        width: double.infinity, //use as max widht that you can
        child: Container(
          margin: const EdgeInsets.all(40),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   Text(
                      currentQuestion.text,
                      style: GoogleFonts.lato(
                       color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                     textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 30),
                //iterate and map the list of answer
                  ...currentQuestion.getShuffledAnswer().map((item) { //... it is spread operator, because Column accepts list o widget not nested list
                    return AnswerButton(answerText: item,
                        onTap: () {
                      answerQuestion(item);
                    }
                  );
                }),
          ],
        ),
      ),
    );
  }
}