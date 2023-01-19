import 'package:exericseapicurde/model/questionModel.dart';
import 'package:exericseapicurde/services/question_services.dart';
import 'package:flutter/cupertino.dart';

class QuestionProvider extends ChangeNotifier {
  QuestionProvider() {
    setQuestion();
  }
  List<Question> questions = [];
  List<Question> get getQuestion => questions;

  void setQuestion() async {
    await QuestionServices().fetchQuestion().then((value) {
      questions = value;
    });
    notifyListeners();
  }

  void addQuestion(String questionName) async {
    await QuestionServices().addQuestion(questionName);
  }
}
