import 'package:auctionapp/res/CustomColors.dart';
import 'package:auctionapp/res/text_value.dart';
import 'package:auctionapp/screens/dashbord_screen.dart';
import 'package:auctionapp/screens/home_screen.dart';
import 'package:auctionapp/screens/post_Item_form_screen.dart';
import 'package:auctionapp/screens/sign_in_screen.dart';
import 'package:auctionapp/utils/authentication.dart';
import 'package:auctionapp/widgets/custom_app_bar.Dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        appBar:
        CustomAppBar(
          title: TextValue.appBarTitle,
          backGroundColor: CustomColors.appBarColor,
        ),
        body: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(),
                _user.photoURL != null
                    ? ClipOval(
                        child: Material(
                          color: CustomColors.black.withOpacity(0.3),
                          child: Image.network(
                            _user.photoURL!,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      )
                    : ClipOval(
                        child: Material(
                          color: CustomColors.black.withOpacity(0.3),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: CustomColors.black,
                            ),
                          ),
                        ),
                      ),
                SizedBox(height: 16.0),
                Text(
                  'Hello',
                  style: TextStyle(
                    color: CustomColors.textColor1,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  _user.displayName!,
                  style: TextStyle(
                    color: CustomColors.textColor1,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '( ${_user.email!} )',
                  style: TextStyle(
                    color: CustomColors.textColor1,
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                  'You are now signed in using your Google account. To sign out of your account, click the "Sign Out" button below.',
                  style: TextStyle(
                      color: CustomColors.textColor1.withOpacity(0.8),
                      fontSize: 14,
                      letterSpacing: 0.2),
                ),
                SizedBox(height: 16.0),
                _isSigningOut
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.redAccent,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            _isSigningOut = true;
                          });
                          await Authentication.signOut(context: context);
                          setState(() {
                            _isSigningOut = false;
                          });
                          Navigator.of(context)
                              .pushReplacement(_routeToSignInScreen());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Text(
                            'Sign Out',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
        ),
      ),
    );
  }
}
