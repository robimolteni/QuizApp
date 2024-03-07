class QuizQuestion {

  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswer() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle(); //riordina a caso gli elementi della lista
    return shuffledList;
  }

}