import 'package:binamod/pages/packet2/widget/question_number_widget.dart';
import 'package:binamod/pages/packet2/widget/question_widget.dart';
import 'package:binamod/pages/packet2/widget/question_yes_no_widget.dart';
import 'package:flutter/material.dart';

class Packet2Page extends StatelessWidget {
  PageController pageController;
  List<Widget> pages = [];
  Packet2Page() {
    pageController = PageController(initialPage: 0);
    fillPages();
  }
  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 60),
              // (PageView)
              Expanded(
                child: PageView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  onPageChanged: (int index) {
                    // _qualityProvider.setSeen(index);
                  },
                  itemCount: pages.length,
                  itemBuilder: (ctx, i) => pages[i],
                ),
                //  (_qualityProvider.doneState == DoneState.INIT)
                //     ? PageView.builder(
                //         physics: _pageViewPhysics(),
                //         scrollDirection: Axis.horizontal,
                //         controller: _pageController,
                //         onPageChanged: (int index) {
                //           _qualityProvider.setSeen(index);
                //         },
                //         itemCount: _pageViews.length,
                //         itemBuilder: (ctx, i) => _pageViews[i] as Widget,
                //       )
                //     : ResultPage(),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }

  void fillPages() {
    pages.add(
      QuestionWidget(
        iconData: Icons.local_convenience_store,
        title: 'Bina Yaşı',
        child: QuestionNumberWidget(
          selectedValue: 0,
          maxValue: 100,
          minValue: 0,
          stepValue: 1,
          checkAnswer: () {},
        ),
      ),
    );
    pages.add(
      QuestionWidget(
        iconData: Icons.local_convenience_store,
        title: 'Bitiş Nizam Mı?',
        child: QuestionYesNoWidget(
          checkAnswer: () {},
        ),
      ),
    );
  }
}
