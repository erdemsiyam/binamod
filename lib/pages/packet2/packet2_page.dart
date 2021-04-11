import 'package:binamod/pages/packet2/enum/answer_enum.dart';
import 'package:binamod/pages/packet2/enum/seen_enum.dart';
import 'package:binamod/pages/packet2/widget/dots_widget.dart';
import 'package:binamod/pages/packet2/widget/question_number_widget.dart';
import 'package:binamod/pages/packet2/widget/question_widget.dart';
import 'package:binamod/pages/packet2/widget/question_yes_no_widget.dart';
import 'package:binamod/pages/packet2/widget/result_widget.dart';
import 'package:binamod/providers/dots_provider.dart';
import 'package:binamod/providers/packet2_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Packet2Page extends StatelessWidget {
  Packet2Provider packet2provider;
  DotsProvider dotsProvider;
  PageController pageController;
  List<QuestionWidget> pages = [];
  Packet2Page() {
    pageController = PageController(initialPage: 0);
    fillPages();
  }

  @override
  Widget build(BuildContext context) {
    packet2provider = Provider.of<Packet2Provider>(context);
    dotsProvider = Provider.of<DotsProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[200],
              Colors.blue[300],
              Colors.blue[400],
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.0),
            stops: [0.0, 0.5, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: dynamicPart(context),
      ),
    );
  }

  void fillPages() {
    pages.clear();
    pages.add(
      QuestionWidget(
        iconData: Icons.local_convenience_store,
        title: 'Bina Yaşı',
        seenState: SeenState.NOW,
        child: QuestionNumberWidget(
          selectedValue: 0,
          maxValue: 100,
          minValue: 0,
          stepValue: 1,
        ),
      ),
    );
    pages.add(
      QuestionWidget(
        iconData: Icons.upgrade,
        title: 'Bina Kat Sayısı',
        child: QuestionNumberWidget(
          selectedValue: 1,
          maxValue: 100,
          minValue: 1,
          stepValue: 1,
        ),
      ),
    );
    pages.add(
      QuestionWidget(
        iconData: Icons.format_line_spacing,
        title: 'Bina Yüksekliği',
        child: QuestionNumberWidget(
          selectedValue: 9,
          maxValue: 60,
          minValue: 3,
          stepValue: 3,
        ),
      ),
    );
    pages.add(
      QuestionWidget(
        iconData: Icons.water_damage,
        title: 'Korozyon Var Mı?',
        child: QuestionYesNoWidget(
          onClick: doneControl,
        ),
      ),
    );
    pages.add(
      QuestionWidget(
        iconData: Icons.my_location,
        title: 'Bina Oturum Alanı',
        child: QuestionNumberWidget(
          selectedValue: 100,
          maxValue: 500,
          minValue: 50,
          stepValue: 50,
        ),
      ),
    );
    pages.add(
      QuestionWidget(
        iconData: Icons.fastfood,
        title: 'Zemin Katta Dükkan Var Mı?',
        child: QuestionYesNoWidget(
          onClick: doneControl,
        ),
      ),
    );
    pages.add(
      QuestionWidget(
        iconData: Icons.location_city,
        title: 'Bina Bitişik Nizam Mı?',
        child: QuestionYesNoWidget(
          onClick: doneControl,
        ),
      ),
    );
  }

  Widget dynamicPart(BuildContext context) {
    switch (packet2provider.packet2State) {
      case Packet2State.INIT:
        return questionsWidget();
      case Packet2State.LOADING:
        return loadingWidget();
      case Packet2State.FAIL:
        return failWidget();
      case Packet2State.DONE:
        return ResultWidget(
          onReset: () {
            dotsProvider.updateDots(0, [], []);
            fillPages();
          },
        );
    }
    return Container();
  }

  Widget questionsWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 60),
        // (PageView)
        Expanded(
          flex: 10,
          child: PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: pageController,
            onPageChanged: (int index) {
              print('pageview 1. sayfa');
              updateSeenStates(index);
              if (!doneControl()) {
                updateDots(index);
              } else {}
            },
            itemCount: pages.length,
            itemBuilder: (ctx, i) => pages[i],
          ),
        ),
        Expanded(
          flex: 1,
          child: DotsWidget(),
        ),
      ],
    );
  }

  Widget loadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget failWidget() {
    return Column(
      children: [
        Text('Bazı hatalar meydana geldi.'),
        IconButton(
          // Result sayfasından çalındı
          icon: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          onPressed: () {
            dotsProvider.updateDots(0, [], []);
            fillPages();
            packet2provider.reset();
          },
        ),
      ],
    );
  }

  void updateSeenStates(int index) {
    pages.where((x) => x.seenState == SeenState.NOW).first.seenState =
        SeenState.SEEN;
    pages[index].seenState = SeenState.NOW;
  }

  bool doneControl() {
    bool isDone =
        pages.where((x) => x.child.answerState == AnswerState.INIT).length == 0;
    if (isDone) {
      packet2provider.sendQualityAnswers(
        longitude: 123, // TODO homeproviderden gelecek
        latitude: 123,
        age: (pages[0].child as QuestionNumberWidget).selectedValue,
        floors: (pages[1].child as QuestionNumberWidget).selectedValue,
        height: (pages[2].child as QuestionNumberWidget).selectedValue,
        corrosion: (pages[3].child as QuestionYesNoWidget).answerState ==
            AnswerState.YES,
        area: (pages[4].child as QuestionNumberWidget).selectedValue,
        shop: (pages[5].child as QuestionYesNoWidget).answerState ==
            AnswerState.YES,
        contiguous: (pages[6].child as QuestionYesNoWidget).answerState ==
            AnswerState.YES,
      );
    }
    return isDone;
  }

  void updateDots(int index) {
    dotsProvider.selectedIndex = index;
    List<SeenState> seenStates = [];
    List<AnswerState> answerStates = [];
    for (var x in pages) {
      seenStates.add(x.seenState);
      answerStates.add(x.child.answerState);
    }
    dotsProvider.updateDots(index, seenStates, answerStates);
  }
}
