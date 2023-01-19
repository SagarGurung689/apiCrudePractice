import 'dart:convert';

import 'package:exericseapicurde/model/questionModel.dart';

import 'package:http/http.dart' as http;

class QuestionServices {
  static String baseUrl = "https://loksewa-quiz.herokuapp.com/";

  Future<List<Question>> fetchQuestion() async {
    var Url = Uri.parse(baseUrl + "question-category");
    var response = await http.get(Url);

    List<Question> questions = [];

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var json = jsonDecode(jsonString);

      for (var item in json) {
        questions.add(Question.formjson(item));
      }
      return questions;
    } else
      return questions;
  }

  Future<bool> addQuestion(String questionName) async {
    var Url = Uri.parse(baseUrl + 'question-category');
    var response = await http.post(Url,
        headers: <String, String>{
          'content-Type': "Application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, String>{'name': questionName}));

    print(response.statusCode);

    if (response.statusCode == 201) {
      print("Question is added");
      return true;
    } else
      print("Question hard to added");
    return false;
  }
}
