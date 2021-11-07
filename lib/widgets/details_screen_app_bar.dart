import 'package:auctionapp/res/CustomColors.dart';
import 'package:flutter/material.dart';

class AppBarDetailScreen extends StatelessWidget implements PreferredSize{
  final Color backGroundColor;
  const AppBarDetailScreen({
    required this.backGroundColor,
  });
  //: super (key: key);
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(45.0);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      backgroundColor: backGroundColor,
      actions: [
        IconButton(onPressed: null, icon: Icon(Icons.more_vert,color: CustomColors.appBarIconColor,),iconSize: 20,)
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();



}