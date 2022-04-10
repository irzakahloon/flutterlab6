import 'package:flutter/material.dart';
import 'package:lab_6/questionBank.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  QuestionBank quest = QuestionBank();

  List<Widget> scorkeeper = [];

  void compareAnswer(bool answer) {
    bool corretAnswer = quest.correctAnswer();
    if (quest.isFinished() == true) {
      quest.reset();
      scorkeeper = [];
    } else {
      if (corretAnswer == answer) {
        scorkeeper.add(
          Icon(Icons.check, color: Colors.green),
        );
      } else {
        scorkeeper.add(
          Icon(Icons.close, color: Colors.red),
        );
      }
      setState(() {
        quest.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xFF0D1117),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 300,
                  child: Center(
                    child: Text(
                      " ${quest.getQuestion()}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 80,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: FlatButton(
                      shape: StadiumBorder(),
                      onPressed: () {
                        compareAnswer(true);
                      },
                      child: Text(
                        'True',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.green,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: FlatButton(
                      shape: StadiumBorder(),
                      color: Colors.red,
                      onPressed: () {
                        compareAnswer(false);
                      },
                      child: Text(
                        'False',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: scorkeeper,
                )
              ],
            ),
          ),
        ));
  }
}
