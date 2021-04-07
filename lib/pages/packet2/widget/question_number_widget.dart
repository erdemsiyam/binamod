import 'package:binamod/pages/packet2/enum/answer_enum.dart';
import 'package:binamod/pages/packet2/widget/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

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
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(),
          ),
          NumberPicker.integer(
            initialValue: widget.selectedValue,
            minValue: widget.minValue,
            step: widget.stepValue,
            maxValue: widget.maxValue,
            highlightSelectedValue: true,
            onChanged: (numy) {
              setState(() {
                widget.selectedValue = numy;
              });
            },
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 50,
                ),
                child: Text(
                  widget.unit ?? '',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// class QuestionNumberWidget extends StatefulWidget {
//   IconData iconData;
//   String title;
//   int selectedValue, maxValue, minValue, stepValue;
//   String unit;
//   Function checkAnswer;
//   QuestionNumberWidget({
//     Key key,
//     @required this.iconData,
//     @required this.title,
//     @required this.selectedValue,
//     @required this.maxValue,
//     @required this.minValue,
//     @required this.stepValue,
//     this.unit,
//     @required this.checkAnswer,
//   }) : super(key: key);

//   @override
//   _QuestionNumberWidgetState createState() => _QuestionNumberWidgetState();
// }

// class _QuestionNumberWidgetState extends State<QuestionNumberWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Container(
//           height: 200,
//           alignment: Alignment.center,
//           child: Container(
//             padding: EdgeInsets.all(26),
//             decoration: BoxDecoration(
//               color: Colors.white30,
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               widget.iconData,
//               size: 130,
//               color: Colors.blue,
//             ),
//           ),
//         ),
//         Container(
//           alignment: Alignment.center,
//           height: 120,
//           child: Text(
//             widget.title,
//             textAlign: TextAlign.center,
//           ),
//         ),
//         Expanded(
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Flexible(
//                 flex: 1,
//                 child: Container(),
//               ),
//               NumberPicker.integer(
//                 initialValue: widget.selectedValue,
//                 minValue: widget.minValue,
//                 step: widget.stepValue,
//                 maxValue: widget.maxValue,
//                 highlightSelectedValue: true,
//                 onChanged: (numy) {
//                   setState(() {
//                     widget.selectedValue = numy;
//                   });
//                 },
//               ),
//               Flexible(
//                 flex: 1,
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       top: 50,
//                     ),
//                     child: Text(
//                       widget.unit ?? '',
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// TODO : number alanı çıkarılıp sadece orası stateful yapılabilir
