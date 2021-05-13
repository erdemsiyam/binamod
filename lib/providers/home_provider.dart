import 'package:flutter/material.dart';
import 'package:location/location.dart';

class HomeProvider with ChangeNotifier {
  Location location;
  PageController pageController = PageController(
    initialPage: 0, // başlangıç sayfa indexi
    keepPage: true,
    viewportFraction: 1, // her pageview sayfasının arasındaki uzaklık
  );
  goToPacket1() {
    pageController.jumpToPage(0);
    notifyListeners();
  }
}
