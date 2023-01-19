import 'package:flutter/material.dart';

class AddQuestionCard extends StatefulWidget {
  final String? userName;
  final String? cdate;
  const AddQuestionCard({super.key, this.userName, this.cdate});

  @override
  State<AddQuestionCard> createState() => _AddQuestionCardState();
}

class _AddQuestionCardState extends State<AddQuestionCard> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var hh = media.height;
    var ww = media.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: hh * 0.1,
          width: ww * 0.8,
          decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [Text(widget.userName!), 
                  Text(widget.cdate!)],
                ),
              ),
              Icon(Icons.delete)
            ],
          )),
    );
  }
}
