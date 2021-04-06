import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  PageController pageController;
  BottomSheetWidget(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Olası Hasar',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                kolon2(Color(0x3087f9fa), 'Hafif'),
                kolon2(Color(0x30fcc940), 'Orta'),
                kolon2(Color(0x30fd702f), 'Ağır'),
                kolon2(Color(0x30c6211d), 'Çok Ağır', isSelected: true),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 22),
            Text(
              'Bugüne Kadar Oluşan',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                satir('Can Kaybı', '2300 adet'),
                SizedBox(height: 6),
                satir('Büyük Depremler', '7 adet'),
                SizedBox(height: 6),
                satir('Depremin Büyüklüğü', '7,5'),
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.4,
            ),
            Text(
              'Beklenen depremin ivmesi 0.33 g 17 Ağustos 99 Depreminin 0.8 katıdır.',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(height: 6),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  pageController.animateToPage(
                    1,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeInCubic,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Bina Risk Önceliklendirmesi'),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget kolon(int index, Color color, {bool isHuge = false}) {
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: (isHuge) ? 60 : 30,
      color: color,
      child: Text(
        index.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget cardText(String text) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ),
    );
  }

  Widget kolon2(Color color, String text, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        height: 26,
        alignment: Alignment.center,
        color: (isSelected) ? color.withAlpha(255) : color,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget satir(String textLeft, String textRight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              textLeft,
              style: TextStyle(fontSize: 12),
            ),
          ),
          flex: 1,
        ),
        Flexible(
          child: Container(
            child: Text(
              textRight,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          flex: 1,
        ),
      ],
    );
  }
}
