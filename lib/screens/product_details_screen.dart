import 'package:auctionapp/res/CustomColors.dart';
import 'package:auctionapp/widgets/details_screen_app_bar.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  var _product;
  ProductDetails(this._product);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.appBackGroundColor,
      appBar: AppBarDetailScreen(backGroundColor: Colors.black,),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                    aspectRatio: 2,
                    child: Image.asset(
                      'images/dumy.jpg',
                      fit: BoxFit.fitWidth,
                    )),
                Text(
                  widget._product['title'],
                  style: TextStyle(color: CustomColors.textColor1, fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(widget._product['desc'],
                  style: TextStyle(color: CustomColors.textColor1, fontWeight: FontWeight.bold, fontSize: 10),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                 "Min: " "${widget._product['price'].toString()}" " Tk",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red),
                ),
                Divider(),
                SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Bid",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: CustomColors.appBarTextColor,
                        elevation: 3,
                      ),
                    ),
                  ),

              ],
            ),
          )),
    );
  }
}