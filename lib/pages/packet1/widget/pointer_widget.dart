import 'package:binamod/providers/packet1_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PointerWidget extends StatelessWidget {
  final String mapSignLogo = 'asset/images/map_sign.svg';
  final String mapSignLabel = 'Map Sign Icon';
  Color signColor = Colors.blue;
  double pointerSize;
  PointerWidget({this.pointerSize});
  Packet1Provider packet1provider;
  @override
  Widget build(BuildContext context) {
    packet1provider = Provider.of<Packet1Provider>(context);
        // TODO Sign colo sonuca göre  değişmeli
    switch (packet1provider.packet1State) {
      case Packet1State.INIT:
      case Packet1State.LOADING:
        signColor = Colors.blue;
        break;
      default:
        signColor = Color(0xffc6211d);;
    }
    return IgnorePointer(
      child: SvgPicture.asset(
        mapSignLogo,
        semanticsLabel: mapSignLabel,
        width: pointerSize,
        color: signColor,
      ),
    );
  }
}
