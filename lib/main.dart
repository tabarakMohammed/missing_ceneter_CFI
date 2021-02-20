import 'package:flutter/material.dart';
import 'package:missing_center/Logic/business/Auth.dart';
import 'package:missing_center/ui/home.dart';
import 'package:missing_center/ui/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()  {
  //async
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // String token = await prefs.get('Token');
  // print(token);
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Cairo'),
    home: MyApp(),//token == null? LoginPage():MyApp(),
    builder: (BuildContext context, Widget child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Builder(
          builder: (BuildContext context) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: child,
            );
          },
        ),
      );
    },
  ));
}

class MyApp extends StatefulWidget   {

  @override
  State<StatefulWidget> createState() {

    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
   UserAuth userAuth = new UserAuth();
  String checkToken = "";
  void checked() async{
   // SharedPreferences prefs = await SharedPreferences.getInstance();
    //String token = await prefs.get('Token');
    String token = await userAuth.returnToken();
    print("from if ... " + token );
    checkToken = token;
  }

  @override
  void initState(){
    checked();
    super.initState();

    Future.delayed(
      Duration(seconds: 2),
          () {
        // String d = await userAuth.returnToken();
        // print("from b ... " + d );
        if ( checkToken == null ||checkToken == ""  ) {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => LoginPage()), (
                  _) => false);

        } else {
          print("from else ... " + checkToken);
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => HomePage()), (
                  _) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('images/splashscreen.jpg', fit: BoxFit.fill),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100, right: 100),
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset('images/logo2.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 300, right: 100),
            child: Text('مركز المفقودين',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
              padding: EdgeInsets.only(top: 640, right: 110),
              child: Text('2019 Code for iraq',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
