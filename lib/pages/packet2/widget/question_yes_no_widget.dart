import 'package:binamod/pages/packet2/enum/answer_enum.dart';
import 'package:binamod/pages/packet2/widget/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:binamod/utils/context_extension.dart';

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
            button(AnswerState.YES),
            button(AnswerState.NO),
          ],
        ),
      ),
    );
  }

  Widget button(AnswerState answerState) {
    return ElevatedButton(
      child: Icon(
        (answerState == AnswerState.YES)
            ? Icons.done
            : (answerState == AnswerState.NO)
                ? Icons.close
                : Icons.hourglass_empty,
        color: Colors.blue[800],
        size: context.dynamicHeight(0.039),
      ),
      style: ElevatedButton.styleFrom(
        primary: (answerState == AnswerState.YES &&
                widget.answerState == AnswerState.YES)
            ? Colors.green[200]
            : ((answerState == AnswerState.NO &&
                    widget.answerState == AnswerState.NO))
                ? Colors.red[200]
                : Colors.blue[100],
        padding: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth(0.0731),
          vertical: context.dynamicHeight(0.0244),
        ),
        textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            context.dynamicHeight(0.0244),
          ),
        ),
      ),
      onPressed: () {
        setState(() {
          widget.answerState = answerState;
        });
        widget.onClick.call();
      },
    );
  }
}
