import 'package:auctionapp/res/CustomColors.dart';
import 'package:auctionapp/screens/post_item_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dashbord_screen.dart';
import 'extara_screen.dart';
import 'item_gallery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  late User _user;
  var CurrentIndex =0;
  final pages = [
    ItemGalleryScreen(),
    ExtraScreen(),
    PostItemFormScreen(),
    DashBordScreen(),
    DashBordScreen()



  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.appBackGroundColor,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: CurrentIndex,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.redAccent,
                icon: Icon(Icons.home),
                title: Text("Items")),
            BottomNavigationBarItem(icon: Icon(Icons.message),
                title: Text("Extra")),
            BottomNavigationBarItem(icon: Icon(Icons.add),
                title: Text("Create")),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard),
                title: Text("DashBord")),
            BottomNavigationBarItem(icon: Icon(Icons.people),
                title: Text("Profile")),
          ],
          onTap: (index){
            setState(() {
              CurrentIndex = index;
            });
          },
        ),
        body: pages[CurrentIndex],
      ),
    );
  }
}