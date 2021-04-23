import 'package:binamod/pages/packet2/enum/answer_enum.dart';
import 'package:binamod/pages/packet2/widget/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:binamod/utils/context_extension.dart';

class QuestionNumberWidget extends StatefulWidget
    implements IQuestionChildWidget {
  int selectedValue, maxValue, minValue, stepValue;
  String unit;
  @override
  AnswerState answerState;
  QuestionNumberWidget({
    Key key,
    @required this.selectedValue,
    @required this.maxValue,
    @required this.minValue,
    @required this.stepValue,
    this.unit,
  }) : super(key: key) {
    answerState = AnswerState.YES;
  }
  @override
  _QuestionNumberWidgetState createState() => _QuestionNumberWidgetState();
}

class _QuestionNumberWidgetState extends State<QuestionNumberWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: SizedBox(
                child: Container(),
              ),
            ),
            NumberPicker(
              value: widget.selectedValue,
              minValue: widget.minValue,
              maxValue: widget.maxValue,
              step: widget.stepValue,
              haptics: true,
              textStyle: context.theme.textTheme.headline6.copyWith(
                color: Colors.grey[300],
                fontSize: context.dynamicShortest(0.05),
              ),
              selectedTextStyle: context.theme.textTheme.headline4.copyWith(
                color: Colors.white,
                fontSize: context.dynamicShortest(0.08),
              ),
              onChanged: (numy) {
                setState(() {
                  widget.selectedValue = numy;
                });
              },
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.unit ?? '',
                  style: context.theme.textTheme.headline5.copyWith(
                    color: Colors.white,
                    fontSize: context.dynamicShortest(0.058),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
