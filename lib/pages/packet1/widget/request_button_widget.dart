import 'package:binamod/model/packet1_response_model.dart';
import 'package:binamod/providers/packet1_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:binamod/pages/packet1/widget/bottom_sheet_widget.dart';
import 'package:binamod/utils/context_extension.dart';
import 'package:provider/provider.dart';

class RequestButtonWidget extends StatelessWidget {
  Packet1Provider packet1provider;
  PageController pageController;
  RequestButtonWidget({@required this.pageController});
  @override
  Widget build(BuildContext context) {
    packet1provider = Provider.of<Packet1Provider>(context);
    switch (packet1provider.packet1State) {
      case Packet1State.INIT:
        return initButton(context);
      case Packet1State.LOADING:
        return Center(child: CircularProgressIndicator());
      default:
    }
    return Container();
  }

  Widget initButton(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: EdgeInsets.all(context.dynamicHeight(0.016)),
        child: Text(
          'Deprem Tehlikesi',
          style: context.theme.textTheme.button.copyWith(
            color: Colors.blue[600],
            fontWeight: FontWeight.bold,
            fontSize: context.dynamicShortest(0.033),
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        textStyle: context.theme.textTheme.subtitle1.copyWith(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            context.dynamicWidth(0.049),
          ),
        ),
      ),
      onPressed: () async {
        if (packet1provider.lastLocation == null) return;
        print('Selected Location : ${packet1provider.lastLocation}');
        Packet1ResponseModel packet1responseModel = await packet1provider
            .requestLocation(latLng: packet1provider.lastLocation);
        await showMaterialModalBottomSheet(
          expand: false,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => BottomSheetWidget(
            pageController: pageController,
            packet1responseModel: packet1responseModel,
          ),
        );
        packet1provider.packet1State = Packet1State.INIT;
      },
    );
  }
}
