import 'package:binamod/pages/packet1/packet1_page.dart';
import 'package:binamod/pages/packet2/packet2_page.dart';
import 'package:binamod/providers/dots_provider.dart';
import 'package:binamod/providers/home_provider.dart';
import 'package:binamod/providers/packet1_provider.dart';
import 'package:binamod/providers/packet2_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  PageController pageController = PageController(
    initialPage: 0, // başlangıç sayfa indexi
    keepPage: true,
    viewportFraction: 1, // her pageview sayfasının arasındaki uzaklık
  );
  HomeProvider _homeProvider;
  @override
  Widget build(BuildContext context) {
    _homeProvider = Provider.of<HomeProvider>(context);
    // _homeProvider.pageController = pageController;
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      // (_homeProvider.getScrollable())
      // ? ScrollPhysics()
      // : NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      controller: pageController,
      children: [
        // TODO alttakini geri aç
        // ChangeNotifierProvider<Packet1Provider>(
        //   create: (_) => Packet1Provider(),
        //   child: Packet1Page(pageController),
        // ),

        // ChangeNotifierProvider<Packet2Provider>(
        //   create: (_) => Packet2Provider(),
        //   child: Packet2Page(),
        // ),

        MultiProvider(
          providers: [
            // Provider<Packet2Provider>(create: (_) => Packet2Provider()),
            // Provider<DotsProvider>(create: (_) => DotsProvider()),
            ChangeNotifierProvider<Packet2Provider>(
                create: (_) => Packet2Provider()),
            ChangeNotifierProvider<DotsProvider>(create: (_) => DotsProvider()),
          ],
          child: Packet2Page(),
        ),
      ],
      onPageChanged: (i) {
        // _homeProvider.setScrollable(false);
      },
    );
  }
}
