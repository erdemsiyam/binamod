import 'package:binamod/model/packet2_response_model.dart';
import 'package:binamod/providers/packet2_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:binamod/utils/context_extension.dart';

class ResultWidget extends StatelessWidget {
  Packet2Provider _packet2provider;
  Function onReset;
  ResultWidget({
    @required this.onReset,
  });
  @override
  Widget build(BuildContext context) {
    _packet2provider = Provider.of<Packet2Provider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.dynamicHeight(0.0617),
        horizontal: context.dynamicWidth(0.0731),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.dynamicHeight(0.025),
              ),
              child: Column(
                children: [
                  resultText(context),
                  context.emptyWidgetHeightMedium,
                  detailButton(context),
                ],
              ),
            ),
          ),
          _riskLevel(
            context,
            ResultState.LOW_RISK,
          ),
          _riskLevel(
            context,
            ResultState.MEDIUM_RISK,
          ),
          _riskLevel(
            context,
            ResultState.HIGH_RISK,
          ),
          _riskLevel(
            context,
            ResultState.VERY_HIGH_RISK,
          ),
          resetButton(context),
        ],
      ),
    );
  }

  Widget resultText(BuildContext context) {
    return Text(
      _packet2provider.packet2responseModel.resultText,
      textAlign: TextAlign.center,
      style: context.theme.textTheme.headline5.copyWith(
        color: Colors.blue[900],
      ),
    );
  }

  Widget detailButton(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'Detay Göster',
        style: context.theme.textTheme.subtitle1.copyWith(
          color: Colors.blue[900],
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue[100],
        textStyle: context.theme.textTheme.subtitle1.copyWith(
          color: Colors.blue[900],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            context.dynamicHeight(0.02),
          ),
        ),
      ),
      onPressed: () {},
    );
  }

  Widget _riskLevel(
    BuildContext context,
    ResultState resultState,
  ) {
    String text;
    Color color;
    switch (resultState) {
      case ResultState.INIT:
        text = "";
        color = Colors.white;
        break;
      case ResultState.LOW_RISK:
        text = "Düşük Risk";
        color = Colors.green[400];
        break;
      case ResultState.MEDIUM_RISK:
        text = "Orta Risk";
        color = Colors.yellow;
        break;
      case ResultState.HIGH_RISK:
        text = "Yüksek Risk";
        color = Colors.orange;
        break;
      case ResultState.VERY_HIGH_RISK:
        text = "Çok Yüksek Risk";
        color = Colors.red;
        break;
    }
    return Row(
      children: [
        Container(
          height: context.dynamicHeight(0.0487),
          width: (_packet2provider.packet2responseModel.result == resultState)
              ? context.dynamicWidth(0.732)
              : context.dynamicWidth(0.0975),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                context.dynamicShortest(0.0243),
              ),
              bottomRight: Radius.circular(
                context.dynamicShortest(0.0243),
              ),
            ),
          ),
          child: (_packet2provider.packet2responseModel.result == resultState)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      text ?? "",
                      style: context.theme.textTheme.subtitle1.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    context.emptyWidgetWidthMedium,
                  ],
                )
              : Container(),
        ),
      ],
    );
  }

  Widget resetButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.refresh,
        size: context.dynamicShortest(0.08),
        color: Colors.white,
      ),
      onPressed: () {
        onReset.call();
        _packet2provider.reset();
      },
    );
  }

  Widget fail(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Hata'),
          resetButton(context),
        ],
      ),
    );
  }
}
