import 'package:auctionapp/res/CustomColors.dart';
import 'package:auctionapp/res/text_value.dart';
import 'package:auctionapp/screens/user_info_screen.dart';
import 'package:auctionapp/widgets/custom_app_bar.Dart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashbord_screen.dart';
import 'home_screen.dart';

class PostItemScreen extends StatefulWidget {
  const PostItemScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;
  _PostItemScreenState createState() => _PostItemScreenState();
}

class _PostItemScreenState extends State<PostItemScreen> {
  late User _user;
  final _keyForm = GlobalKey<FormState>();
  var xyz;

  final itemtitleController = TextEditingController();
  final itemDescriptionController = TextEditingController();
  final itemPriceController = TextEditingController();
  final itemQuantityController = TextEditingController();
  final imageURL = "https://www.google.com/search?q=dummy+product+image&tbm=isch&ved=2ahUKEwi3xP6Ph4T0AhULXCsKHcP3C_8Q2-cCegQIABAA&oq=dummy+product+image&gs_lcp=CgNpbWcQAzIFCAAQgAQyBQgAEIAEMgYIABAIEB4yBAgAEBg6BwgjEO8DECc6BAgAEEM6BggAEAcQHjoICAAQBxAFEB46CAgAEAgQBxAeUNYIWPUZYM8faABwAHgAgAF-iAG8B5IBAzEuOJgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=rZ-GYfe5KIu4rQHD76_4Dw&rlz=1C1CHBD_enBD868BD868#imgrc=ZQHHESFcELOS_M";

  Future addData() async{

    final db =FirebaseFirestore.instance.collection("Items").add({
      'title': itemtitleController.text,
      'price': itemPriceController.text,
      'quantity': itemQuantityController.text,
      'desc': itemDescriptionController.text,
      'imageURL': imageURL,
      'userEmail': _user.email,
    });
    print("data add Complete");
  }

  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FabCircularMenu(
          ringColor: CustomColors.fabMenuRingColor,
          ringWidth: 80,
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
      body:
      Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 10,bottom: 10),
          child: Form(
            key: _keyForm,
            child: ListView(
              children: [
                TextFormField(
                  style: TextStyle(
                      color: CustomColors.black
                  ),
                  controller: itemtitleController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onChanged: (v){xyz = v;},
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter item Title';
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Item Title',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: CustomColors.textColor1
                      ),
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(color: Colors.lightBlueAccent, width: 0.0,),
                        borderRadius: BorderRadius.all(Radius.circular(15.0),),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(style: TextStyle(
                    color: CustomColors.black
                ),
                  controller: itemPriceController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  //maxLength: 11,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter item minimum price';
                    }else{
                      /*if(value.length == 11){
                        return null;
                      }else{
                        return 'Please enter 11 digit mobile number';
                      }*/

                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Minimum Price',
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: CustomColors.textColor1
                      ),
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(color: Colors.lightBlueAccent, width: 0.0,),
                        borderRadius: BorderRadius.all(Radius.circular(15.0),),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  style: TextStyle(
                      color: CustomColors.black
                  ),
                  controller: itemQuantityController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter Quantity of product';
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Quantity',
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: CustomColors.textColor1
                      ),
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(color: Colors.lightBlueAccent, width: 0.0,),
                        borderRadius: BorderRadius.all(Radius.circular(15.0),),
                      ),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.all(Radius.circular(15.0),)
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  style: TextStyle(
                      color: CustomColors.black
                  ),
                  controller: itemDescriptionController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter item description';
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Item Description',
                      hintStyle: TextStyle(
                        fontSize: 18,
                          color: CustomColors.textColor1
                      ),
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(color: Colors.lightBlueAccent, width: 0.0,),
                        borderRadius: BorderRadius.all(Radius.circular(15.0),),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                      )
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: (){
                      addData().then((value){
                        itemtitleController.clear();
                        itemDescriptionController.clear();
                        itemPriceController.clear();
                        itemQuantityController.clear();
                      });

                    },
                    child: Text('Save'))
              ],
            ),
          ),
        ),
      ),

    ));
  }

}
