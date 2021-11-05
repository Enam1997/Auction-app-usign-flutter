import 'package:auctionapp/res/CustomColors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize{
  final String title;
  final Color backGroundColor;
  const CustomAppBar({
    //required Key key,
    required this.title, required this.backGroundColor,
});
      //: super (key: key);
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      backgroundColor: backGroundColor,
      title: Text(title,style: TextStyle(
        color: CustomColors.appBarTextColor,
        fontSize: 26,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
      ),),
      elevation: 2,
      actions: [
        IconButton(onPressed: null, icon: Icon(Icons.more_vert,color: CustomColors.appBarIconColor,))
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();


  
}