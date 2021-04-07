import 'package:binamod/pages/packet2/enum/answer_enum.dart';
import 'package:binamod/pages/packet2/enum/seen_enum.dart';
import 'package:binamod/providers/dots_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DotsWidget extends StatelessWidget {
  DotsProvider dotsProvider;
  @override
  Widget build(BuildContext context) {
    dotsProvider = Provider.of<DotsProvider>(context);
    print('calisti');
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _dots(),
    );
  }

  List<Widget> _dots() {
    List<Widget> dots = [];
    SeenState seenState;
    AnswerState answerState;

    // İlk açılış için ilk veriler verilir.
    if (dotsProvider.seenStates.length == 0) {
      dotsProvider.seenStates.add(SeenState.NOW);
      dotsProvider.seenStates
          .addAll(List<SeenState>.generate(6, (i) => SeenState.NOT));
      dotsProvider.answerStates
          .addAll(List<AnswerState>.generate(7, (i) => AnswerState.INIT));
    }

    for (int i = 0; i < dotsProvider.seenStates.length; i++) {
      seenState = dotsProvider.seenStates[i];
      answerState = dotsProvider.answerStates[i];
      dots.add(
        CircleAvatar(
          backgroundColor: (seenState == SeenState.SEEN &&
                  answerState != AnswerState.INIT)
              ? Colors.green
              : (seenState == SeenState.SEEN && answerState == AnswerState.INIT)
                  ? Colors.red
                  : (seenState == SeenState.NOT || seenState == SeenState.NOW)
                      ? Colors.blue[800]
                      : Colors.grey,
          radius: (seenState == SeenState.NOW) ? 12 : 8,
        ),
      );
    }
    return dots;
  }
}
