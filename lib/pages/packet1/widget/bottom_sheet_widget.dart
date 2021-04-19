import 'package:flutter/material.dart';
import 'package:binamod/utils/context_extension.dart';

class BottomSheetWidget extends StatelessWidget {
  PageController pageController;
  BottomSheetWidget(this.pageController);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.dynamicShortest(0.0488)),
          topRight: Radius.circular(context.dynamicShortest(0.0488)),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(context.dynamicShortest(0.0585)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Text(
                'Olası Hasar',
                textAlign: TextAlign.center,
                style: context.theme.textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.primaryColor,
                  // fontSize: context.dynamicShortest(0.048),
                ),
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kolon(context, Color(0x3087f9fa), 'Hafif'),
                  kolon(context, Color(0x30fcc940), 'Orta'),
                  kolon(context, Color(0x30fd702f), 'Ağır'),
                  kolon(context, Color(0x30c6211d), 'Çok Ağır',
                      isSelected: true),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.4,
            ),
            Text(
              'Bugüne Kadar Oluşan',
              style: context.theme.textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: context.dynamicShortest(0.035),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                satir(context, 'Can Kaybı', '2300 adet'),
                satir(context, 'Büyük Depremler', '7 adet'),
                satir(context, 'Depremin Büyüklüğü', '7,5'),
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.4,
            ),
            Text(
              'Beklenen depremin ivmesi 0.33 g 17 Ağustos 99 Depreminin 0.8 katıdır.',
              style: context.theme.textTheme.caption.copyWith(
                fontSize: context.dynamicShortest(0.03),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      context.dynamicWidth(0.073),
                    ),
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
                  padding: EdgeInsets.all(
                    context.dynamicShortest(0.025),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bina Risk Önceliklendirmesi',
                        style: context.theme.textTheme.bodyText1.copyWith(
                          color: Colors.white,
                          fontSize: context.dynamicShortest(0.032),
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        size: context.dynamicShortest(0.039),
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

  Widget cardText(String text) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ),
    );
  }

  Widget kolon(BuildContext context, Color color, String text,
      {bool isSelected = false}) {
    return Expanded(
      child: Container(
        height: context.dynamicHeight(0.035),
        alignment: Alignment.center,
        color: (isSelected) ? color.withAlpha(255) : color,
        child: Text(
          text,
          style: context.theme.textTheme.bodyText1.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: context.dynamicShortest(0.034),
          ),
        ),
      ),
    );
  }

  Widget satir(BuildContext context, String textLeft, String textRight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              textLeft,
              style: context.theme.textTheme.caption.copyWith(
                fontSize: context.dynamicShortest(0.028),
              ),
            ),
          ),
          flex: 1,
        ),
        Flexible(
          child: Container(
            child: Text(
              textRight,
              style: context.theme.textTheme.caption.copyWith(
                color: Colors.black,
                fontSize: context.dynamicShortest(0.028),
              ),
            ),
          ),
          flex: 1,
        ),
      ],
    );
  }
}
