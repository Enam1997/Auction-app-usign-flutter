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
  final itemPriceController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();


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
                TextFormField(
                  maxLines: 5,
                  minLines: 2,
                  style: TextStyle(
                      color: CustomColors.black
                  ),
                  controller: itemPriceController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  //maxLength: 11,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter Amount';
                    }else{
                      /*if(value < Min price ){
                          return null;
                        }else{
                          return 'Please Getter Then minimum price ';
                        }*/

                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Ammount',
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
                Divider(),
                SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        final isValid = _keyForm.currentState!.validate();
                        if (!isValid==true) {
                          print("Please Input Something ");
                        }
                        else
                        {
                        }
                        _keyForm.currentState!.save();

                      },
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