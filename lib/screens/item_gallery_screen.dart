import 'package:auctionapp/res/CustomColors.dart';
import 'package:flutter/material.dart';

class ItemGalleryScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.appBackGroundColor,
        body: Center(
          child: Text("ItemGalleryScreen"),
        ),
      ),
    );
  }

}