class Question {
  String? id;
  String? name;
  DateTime? cratedAt;
  DateTime? updatedAt;
  QuestionCount? count;

  Question({this.id, this.name, this.cratedAt, this.updatedAt, this.count});

  Question.formjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cratedAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
   
    count = QuestionCount.fromJson(json['_count']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['createdAt'] = cratedAt;
    data['updatedAt'] = updatedAt;
    data['_count'] = count;

    return data;
  }
}

class QuestionCount {
  int? question;

  QuestionCount({this.question});

  QuestionCount.fromJson(Map<String, dynamic> json) {
    question = json['question'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = question;
    return data;
  }
}
