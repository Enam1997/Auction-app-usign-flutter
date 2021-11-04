import 'package:auctionapp/res/CustomColors.dart';
import 'package:flutter/material.dart';

class ExtraScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: CustomColors.appBackGroundColor,
      body: Center(
        child: Text("ExtraScreen"),
      ),
    );
  }

}