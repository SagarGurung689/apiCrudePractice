import 'package:exericseapicurde/provider/question_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  TextEditingController nameController = TextEditingController();
  String dataToShow = '';
  @override
  Widget build(BuildContext context) {
    QuestionProvider questionProvider = Provider.of<QuestionProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Add Questions')),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: SizedBox(
                width: 200,
                child: TextField(
                  onChanged: ((value) {
                    setState(() {
                      dataToShow = value;
                    });
                  }),
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.question_answer),
                      hintText: "Input Question"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    questionProvider.addQuestion(nameController.text);
                  },
                  child: Text("Add Question")),
            ),
            Container(
              height: 530,
              width: double.maxFinite,
              color: Colors.amber.shade300,
              child: Center(
                child: Text(dataToShow),
              ),
            )
          ]),
        ));
  }
}
