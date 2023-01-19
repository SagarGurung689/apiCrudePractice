import 'package:exericseapicurde/provider/question_provider.dart';
import 'package:exericseapicurde/screens/add_question.dart';
import 'package:exericseapicurde/widget/add_question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var hh = media.height;
    var ww = media.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Question Category")),
      ),
      body: Consumer<QuestionProvider>(
        builder: (context, value, child) {
          if (value.questions.isEmpty) {
            return const Center(
              child: Text('No data'),
            );
          }

          return SingleChildScrollView(
            child: Column(children: [
              Container(
                height: hh * 1,
                width: ww * 1,
                color: Color.fromARGB(255, 161, 190, 240),
                child: ListView.builder(
                  itemCount: value.getQuestion.length,
                  itemBuilder: (context, index) {
                    return AddQuestionCard(
                      userName: value.getQuestion[index].name!,
                      cdate: value.getQuestion[index].cratedAt.toString(),
                    );
                  },
                ),
              )
            ]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddQuestion();
            },
          ));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
