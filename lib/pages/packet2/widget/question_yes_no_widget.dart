import 'package:binamod/pages/packet2/enum/answer_enum.dart';
import 'package:binamod/pages/packet2/widget/question_widget.dart';
import 'package:flutter/material.dart';

class QuestionYesNoWidget extends StatefulWidget
    implements IQuestionChildWidget {
  @override
  AnswerState answerState;
  bool Function() onClick;
  QuestionYesNoWidget({
    Key key,
    @required this.onClick,
  }) {
    answerState = AnswerState.INIT;
  }
  @override
  _QuestionYesNoWidgetState createState() => _QuestionYesNoWidgetState();
}

class _QuestionYesNoWidgetState extends State<QuestionYesNoWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                child: Icon(
                  Icons.done,
                  color: Colors.blue[800],
                  size: 32,
                ),
                color: (widget.answerState == AnswerState.YES)
                    ? Colors.green[200]
                    : Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    widget.answerState = AnswerState.YES;
                  });
                  widget.onClick.call();
                },
              ),
            ),
            Container(
              child: RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.blue[800],
                  size: 32,
                ),
                color: (widget.answerState == AnswerState.NO)
                    ? Colors.red[200]
                    : Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    widget.answerState = AnswerState.NO;
                  });
                  widget.onClick.call();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
