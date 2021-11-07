import 'package:auctionapp/model/item.dart';
import 'package:auctionapp/res/CustomColors.dart';
import 'package:auctionapp/res/text_value.dart';
import 'package:auctionapp/screens/post_Item_form_screen.dart';
import 'package:auctionapp/screens/user_info_screen.dart';
import 'package:auctionapp/widgets/custom_app_bar.Dart.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dashbord_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User _user;
  var _fireStoreInstance = FirebaseFirestore.instance;
  List items = [];

  fetchItem() async {
    QuerySnapshot qn = await _fireStoreInstance.collection("Items").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        items.add({
          "userEmail": qn.docs[i]["userEmail"],
          "title": qn.docs[i]["title"],
          "price": qn.docs[i]["price"],
          "imageURL": qn.docs[i]["imageURL"],
          "desc": qn.docs[i]["desc"],
          "quantity": qn.docs[i]["quantity"],


        });
      }
    });

    // return list;
  }

  void initState() {
    _user = widget._user;

    super.initState();
    fetchItem();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FabCircularMenu(
          ringColor: CustomColors.fabMenuRingColor,
          ringWidth: 100,
          fabColor: CustomColors.fabColor,
          fabCloseColor: CustomColors.fabCloseColor,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.dashboard),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => DashbordScreen(
                        user: _user,
                      ),
                    ),
                  );
                }),
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        user: _user,
                      ),
                    ),
                  );
                }),
            IconButton(
                icon: Icon(Icons.people),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => UserInfoScreen(
                        user: _user,
                      ),
                    ),
                  );
                }),
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => PostItemScreen(
                        user: _user,
                      ),
                    ),
                  );
                })
          ]),
      backgroundColor: CustomColors.appBackGroundColor,
      appBar: CustomAppBar(
        title: TextValue.appBarTitle,
        backGroundColor: CustomColors.appBarColor,
      ),
      body: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 1),
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                color: CustomColors.itemCardColor,
                elevation: 16,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AspectRatio(aspectRatio: 2, child: Image.network(items[index]["imageURL"][0],
                    //   fit: BoxFit.fitHeight,
                    // ),
                    // ),
                    AspectRatio(
                        aspectRatio: 2,
                        child: Image.asset(
                          'images/dumy.jpg',
                          fit: BoxFit.fitWidth,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(5.0),

                      child: Text(
                        "${items[index]["title"]}",
                        style: TextStyle(color: CustomColors.textColor1.withOpacity(1.0),
                            fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("Min Bid: "
                              "${items[index]["price"].toString()}"" Tk",
                            style: TextStyle(color: CustomColors.textColor1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("Quantity : "
                              "${items[index]["quantity"].toString()}",
                            style: TextStyle(color: CustomColors.textColor1),
                          ),
                        )
                      ],
                    )
                    ,
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Bid End : "
                          "07/11/2021",
                        style: TextStyle(color: CustomColors.textColor1),
                      ),
                    ),
                    ButtonBar(
                      children: [
                        ElevatedButton(
                          child: Text('Favourite'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: CustomColors.itemInsideFlutButtonColor,
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ElevatedButton(
                          child: Text('Bid'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: CustomColors.itemInsideFlutButtonColor,
                              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),

                        // FlatButton(
                        //   color: CustomColors.itemInsideFlutButtonColor,
                        //   child: const Text('Bid'),
                        //   onPressed: () {/* ... */},
                        // )
                      ],
                    )
                  ],
                ),
              ),
            )
                //
                ;
          }),
    ));
  }
}
