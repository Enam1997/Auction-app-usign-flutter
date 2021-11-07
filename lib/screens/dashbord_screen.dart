import 'package:auctionapp/res/CustomColors.dart';
import 'package:auctionapp/res/text_value.dart';
import 'package:auctionapp/screens/post_Item_form_screen.dart';
import 'package:auctionapp/screens/user_info_screen.dart';
import 'package:auctionapp/widgets/custom_app_bar.Dart.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen.dart';

class DashbordScreen extends StatefulWidget{

  const DashbordScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;
  _DashbordScreenState createState() => _DashbordScreenState();



}

class _DashbordScreenState extends State<DashbordScreen>{
  late User _user;

  void initState() {
    _user = widget._user;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child: Scaffold(
      floatingActionButton: FabCircularMenu(
          ringColor: CustomColors.fabMenuRingColor,
          ringWidth: 100,
          fabColor: CustomColors.fabColor,
          fabCloseColor: CustomColors.fabCloseColor,
          children: <Widget>[
            IconButton(icon: Icon(Icons.dashboard), onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => DashbordScreen(
                    user: _user,
                  ),
                ),
              );
            }),
            IconButton(icon: Icon(Icons.home), onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(
                    user: _user,
                  ),
                ),
              );
            }),
            IconButton(icon: Icon(Icons.people), onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UserInfoScreen(
                    user: _user,
                  ),
                ),
              );
            }),
            IconButton(icon: Icon(Icons.add), onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => PostItemScreen(
                    user: _user,
                  ),
                ),
              );
            })

          ]
      ),
      backgroundColor: CustomColors.appBackGroundColor,
      appBar: CustomAppBar(
        title: TextValue.appBarTitle,
        backGroundColor: CustomColors.appBarColor,
      ),
      body: Center(
        child: Text(
          "DashBord",style: TextStyle(
          color: CustomColors.textColor1,
          fontSize: 26,
        ),
        ),
      ),
    ));
  }
}