import 'question.dart';

class QuestionBank {
  List<Question> questions = [
    Question(
        'Queen Elizabeth the 1st was the daughter of King Henry the 8th of England?',
        true),
    Question(
        'Vitamin C is also known by the chemical name of Ascorbic Acid?', true),
    Question(
        "The Nobel prize-winning novel ‘The Old Man and the Sea’ was written by the American author John Steinbeck?",
        false),
    Question(
        ' Rapper Nicki Minaj is over 180 cm (5 ft, 10.9 in) in height?', false),
    Question(
        'In theory, it takes over 5,000 helium balloons to lift an average-sized human from the ground?',
        true),
    Question(
        "The Pan American Highway in the U.S.A. is the world’s longest highway?",
        true),
    Question('Transylvania is a historical region located in central Romania?',
        true),
    Question(
        'Disabled Valery Spiridonov was the first person in the world to have his head transplanted onto another body?',
        false),
    Question(
        'The maximum length for a video posted on TikTok is 60 seconds?', true),
    Question('Glass is manufactured mainly from processed sand?', true),
  ];
  int questionNo = 0;

  nextQuestion() {
    questionNo++;
  }

  getQuestion() {
    return questions[questionNo].question;
  }

  bool correctAnswer() {
    return questions[questionNo].answer;
  }

  bool isFinished() {
    if (questionNo >= questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    questionNo = 0;
  }
}
