import 'package:flutter/material.dart';

abstract class IQuestionChildWidget extends Widget {}

class QuestionWidget extends StatelessWidget {
  IconData iconData;
  String title;
  IQuestionChildWidget child;
  QuestionWidget({
    Key key,
    @required this.iconData,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 200,
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(26),
            decoration: BoxDecoration(
              color: Colors.white30,
              shape: BoxShape.circle,
            ),
            child: Icon(
              iconData,
              size: 130,
              color: Colors.blue,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 120,
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
        child,
      ],
    );
  }
}

// TODO : number alanı çıkarılıp sadece orası stateful yapılabilir
