import 'package:binamod/providers/packet2_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultWidget extends StatelessWidget {
  // QualityProvider _qualityProvider;
  Packet2Provider _packet2provider;
  Function onReset;
  ResultWidget({
    @required this.onReset,
  });
  @override
  Widget build(BuildContext context) {
    // _qualityProvider = context.watch<QualityProvider>();
    // switch (_qualityProvider.doneState) {
    //   case DoneState.LOADING:
    //     return loading();
    //   case DoneState.DONE:
    return done(context);
    //   case DoneState.FAIL:
    //     return fail();
    //   case DoneState.INIT:
    //     return Container();
    //   default:
    //     return Container();
    // }
  }

  Widget loading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.center,
          height: 60,
          child: Text(
            'işleniyor',
            // style: fit(
            //   tsLabel2_350,
            //   tsLabel2_450,
            //   tsLabel2_550,
            //   tsLabel2_bigest,
            // ),
          ),
        ),
        Center(
          child: SizedBox(
            // width: fit(70, 100, 140, 180),
            // height: fit(70, 100, 140, 180),
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue[400],
            ),
          ),
        ),
      ],
    );
  }

  Widget done(BuildContext context) {
    _packet2provider = Provider.of<Packet2Provider>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              // fit(20, 30, 20, 70),
            ),
            child: Column(
              children: [
                Text(
                  _packet2provider.packet2responseModel.resultText,
                  // _qualityProvider.resultText,
                  textAlign: TextAlign.center,
                  // style: fit(
                  //   tsTitle2_350,
                  //   tsTitle2_450,
                  //   tsTitle2_550,
                  //   tsTitle2_bigest,
                  // ),
                ),
                SizedBox(
                  height: 20,
                  // fit(10, 20, 30, 40),
                ),
                RaisedButton(
                  color: Colors.blue[100],
                  // padding: EdgeInsets.symmetric(
                  //   vertical: fit(5, 10, 15, 20),
                  //   horizontal: fit(10, 20, 30, 40),
                  // ),
                  child: Text(
                    'Detay Göster',
                    // style: fit(
                    //   tsTextButton3_350,
                    //   tsTextButton3_450,
                    //   tsTextButton3_550,
                    //   tsTextButton3_bigest,
                    // ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                      // fit(12, 20, 28, 36),
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        _riskLevel(
          "Düşük Risk",
          Colors.green[400],
          false,
          // _qualityProvider.result == ResultAnswer.LOW_RISK,
        ),
        _riskLevel(
          "Orta Risk",
          Colors.yellow,
          false,
          // _qualityProvider.result == ResultAnswer.MEDIUM_RISK,
        ),
        _riskLevel(
          "Yüksek Risk",
          Colors.orange,
          true,
          // _qualityProvider.result == ResultAnswer.HIGH_RISK,
        ),
        _riskLevel(
          "Çok Yüksek Risk",
          Colors.red,
          false,
          // _qualityProvider.result == ResultAnswer.VERY_HIGH_RISK,
        ),
        // SizedBox(
        //   height: fit(5, 10, 20, 30),
        // ),
        IconButton(
          // padding: EdgeInsets.only(
          //   bottom: fit(15, 25, 40, 60),
          // ),
          icon: Icon(
            Icons.refresh,
            // size: fit(25, 40, 50, 60),
            color: Colors.white,
          ),
          onPressed: () {
            onReset.call();
            _packet2provider.reset();
          },
        ),
      ],
    );
  }

  Widget _riskLevel(String text, Color color, bool selected) {
    return Padding(
      padding: EdgeInsets.symmetric(
          // horizontal: fit(10, 10, 10, 10),
          ),
      child: Row(
        children: [
          Container(
            height: 40,
            // height: fit(30, 40, 60, 70),
            width: (selected) ? 300 : 40,
            // width: (selected) ? fit(270, 300, 400, 540) : fit(30, 40, 60, 80),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                  10,
                  // fit(10, 14, 18, 22),
                ),
                bottomRight: Radius.circular(
                  10,
                  // fit(10, 14, 18, 22),
                ),
              ),
            ),
            child: (selected)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            // right: fit(2, 6, 12, 16),
                            ),
                        child: Text(
                          text ?? "174.satır",
                          // style: fit(
                          //   tsLabel3_350,
                          //   tsLabel3_450,
                          //   tsLabel3_550,
                          //   tsLabel3_bigest,
                          // ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget fail() {
    // TODO : 9.sayfa http fail durumunda
    return Container();
  }
}
