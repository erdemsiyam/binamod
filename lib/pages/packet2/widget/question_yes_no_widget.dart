import 'package:binamod/pages/packet2/enum/answer_enum.dart';
import 'package:binamod/pages/packet2/widget/question_widget.dart';
import 'package:flutter/material.dart';

class QuestionYesNoWidget extends StatefulWidget
    implements IQuestionChildWidget {
  Function checkAnswer;
  Answer answer;
  QuestionYesNoWidget({
    Key key,
    @required this.checkAnswer,
  });
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
                color: (widget.answer == Answer.YES)
                    ? Colors.green[200]
                    : Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    widget.answer = Answer.YES;
                  });
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
                color: (widget.answer == Answer.NO)
                    ? Colors.red[200]
                    : Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    widget.answer = Answer.NO;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
