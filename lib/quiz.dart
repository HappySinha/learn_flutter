import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Question {
  String questionText;
  bool questionAnswer;
  Question({String q, bool a}) {
    questionText = q;
    questionAnswer = a;
  }
}

class QuizBrain {
  List<Question> _questionBank = [
    Question(
        q: 'There are no real differences between creating WebApps and Mobile-Apps.',
        a: false),
    Question(
        q: 'It is generally accepted that one cannot have weak software processes and create high quality end products.',
        a: true),
    Question(
        q: 'Use of cloud services can speed up information sharing among software team members?',
        a: true),
    Question(
        q: 'Larger programming teams are always more productive than smaller teams.',
        a: false),
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    Question(
        q: 'No piece of square dry paper can be folded in half more than 7 times.',
        a: false),
    Question(
        q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a: true),
    Question(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    Question(
        q: 'The total surface area of two human lungs is approximately 70 square metres.',
        a: true),
    Question(q: 'Google was originally called \"Backrub\".', a: true),
    Question(
        q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
    Question(
        q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true),
    Question(
        q: 'Congratulations,\n You have to completed all Question.\n ThankYou 😊'),
  ];
  int _questionNumber = 0;
  List<Icon> scoreKeeper = [];
  String questionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool questionBool() {
    return _questionBank[_questionNumber].questionAnswer;
    // print(questionBool);
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
      print(_questionNumber);
    }
  }

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.questionBool();
    quizBrain.nextQuestion();
    if (_questionNumber < _questionBank.length - 1) {
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
    }
  }
}

QuizBrain quizBrain = QuizBrain();

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var iconPadding = const EdgeInsets.all(4);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Center(
          child: Text(
            'Live Quiz ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.grey[800],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: Text(
                  quizBrain.questionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            Expanded(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        quizBrain.checkAnswer(true);
                      });
                    },
                    child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                            child: Text('True',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)))))),
            SizedBox(height: 30),
            Expanded(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        quizBrain.checkAnswer(false);
                      });
                    },
                    child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                            child: Text('False',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)))))),
            SizedBox(height: 6),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: quizBrain.scoreKeeper),
          ],
        ),
      ),
    );
  }
}
