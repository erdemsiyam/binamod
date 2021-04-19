import 'package:binamod/pages/packet2/enum/answer_enum.dart';
import 'package:binamod/pages/packet2/enum/seen_enum.dart';
import 'package:flutter/material.dart';
import 'package:binamod/utils/context_extension.dart';

abstract class IQuestionChildWidget extends Widget {
  AnswerState answerState;
}

class QuestionWidget extends StatelessWidget {
  IconData iconData;
  String title;
  IQuestionChildWidget child;
  SeenState seenState;
  QuestionWidget({
    Key key,
    this.seenState = SeenState.NOT,
    @required this.iconData,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 5,
          child: CircleAvatar(
            maxRadius: context.dynamicHeight(0.122),
            backgroundColor: Colors.white30,
            child: Icon(
              iconData,
              size: context.dynamicHeight(0.17),
              color: Colors.blue,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.headline5.copyWith(
              color: Colors.blue[900],
            ),
          ),
        ),
        Flexible(
          flex: 6,
          child: Column(
            children: [
              child,
            ],
          ),
        ),
      ],
    );
  }
}

// TODO : number alanı çıkarılıp sadece orası stateful yapılabilir
