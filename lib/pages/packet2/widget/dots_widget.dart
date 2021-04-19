import 'package:binamod/pages/packet2/enum/answer_enum.dart';
import 'package:binamod/pages/packet2/enum/seen_enum.dart';
import 'package:binamod/providers/dots_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:binamod/utils/context_extension.dart';

class DotsWidget extends StatelessWidget {
  DotsProvider dotsProvider;
  @override
  Widget build(BuildContext context) {
    dotsProvider = Provider.of<DotsProvider>(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _dots(context),
    );
  }

  List<Widget> _dots(BuildContext context) {
    List<Widget> dots = [];
    SeenState seenState;
    AnswerState answerState;

    // Boşluk Widgetleri
    dots.add(context.emptyWidgetWidthHigh);
    dots.add(context.emptyWidgetWidthHigh);

    // İlk açılış için ilk veriler verilir.
    if (dotsProvider.seenStates.length == 0) {
      dotsProvider.seenStates.add(SeenState.NOW);
      dotsProvider.seenStates
          .addAll(List<SeenState>.generate(6, (i) => SeenState.NOT));
      dotsProvider.answerStates
          .addAll(List<AnswerState>.generate(7, (i) => AnswerState.INIT));
    }
    print(dots.length);
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
          radius: (seenState == SeenState.NOW)
              ? context.dynamicShortest(0.0243)
              : context.dynamicShortest(0.0146),
        ),
      );
    }

    // Boşluk Widgetleri
    dots.add(context.emptyWidgetWidthHigh);
    dots.add(context.emptyWidgetWidthHigh);
    return dots;
  }
}
