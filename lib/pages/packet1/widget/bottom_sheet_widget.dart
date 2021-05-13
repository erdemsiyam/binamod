import 'package:binamod/model/packet1_response_model.dart';
import 'package:binamod/providers/packet1_provider.dart';
import 'package:flutter/material.dart';
import 'package:binamod/utils/context_extension.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class BottomSheetWidget extends StatelessWidget {
  Packet1Provider packet1provider;
  PageController pageController;
  Packet1ResponseModel packet1responseModel;
  BottomSheetWidget({
    @required this.pageController,
    @required this.packet1responseModel,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.45),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.dynamicShortest(0.0488)),
          topRight: Radius.circular(context.dynamicShortest(0.0488)),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(context.dynamicShortest(0.0585)),
        child: arrivedData(context),
      ),
    );
  }

  Widget arrivedData(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: Text(
            'Olası Hasar',
            textAlign: TextAlign.center,
            style: context.theme.textTheme.headline6.copyWith(
              fontWeight: FontWeight.bold,
              color: context.theme.primaryColor,
              fontSize: context.dynamicShortest(0.048),
            ),
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kolon(context, Color(0x3087f9fa), 'Hafif',
                  isSelected: DamageState.LOW == packet1responseModel.var7),
              kolon(context, Color(0x30fcc940), 'Orta',
                  isSelected: DamageState.MEDIUM == packet1responseModel.var7),
              kolon(context, Color(0x30fd702f), 'Ağır',
                  isSelected: DamageState.HIGH == packet1responseModel.var7),
              kolon(context, Color(0x30c6211d), 'Çok Ağır',
                  isSelected:
                      DamageState.VERY_HIGH == packet1responseModel.var7),
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
            satir(context, 'Can Kaybı', '${packet1responseModel.var6} adet'),
            satir(context, 'Büyük Depremler',
                '${packet1responseModel.var4} adet'),
            satir(context, 'Depremin Büyüklüğü', packet1responseModel.var5),
          ],
        ),
        Divider(
          color: Colors.grey,
          thickness: 1.4,
        ),
        Text(
          'Beklenen depremin ivmesi ${packet1responseModel.var1} g 17 Ağustos 1999 Kocaeli depreminin ${packet1responseModel.var3} katıdır.',
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
