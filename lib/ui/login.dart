import 'package:fluttertoast/fluttertoast.dart';
import 'package:missing_center/Logic/business/Auth.dart';
import 'package:missing_center/Logic/data/model/userModel.dart';
import 'package:missing_center/ui/home.dart';
import 'package:missing_center/ui/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();



  loginWithEmailAndPassword(String email,String password) async {
    Users nUser = new Users.loginWithEmailAndPassword(email, password);
    UserAuth auth = new UserAuth();
    String check = await auth.login(nUser);
      if(check == "good") {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => HomePage()), (
                _) => false);
     } else {
        setState(() {
          Fluttertoast.showToast(
              msg: "Error",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        });
      }
  }

  loginWithSocialMedia(String email,String password,String socialId) async {

    Users nUser = new Users.loginWithSocialMedia(email, password,socialId);
    UserAuth auth = new UserAuth();
    String check = await auth.login(nUser);
    if(check == "good") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomePage()));
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                      colors: [
                        const Color(0xFF114976),
                        const Color(0xFF155E98),
                        const Color(0xFF1875BC)
                      ],
                      center: Alignment.bottomCenter,
                      radius: 1,
                      tileMode: TileMode.clamp),
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: ClipPath(
                        clipper: ClipImg(),
                        child: Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: 260,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 160),
                child: Container(
                  height: 150,
                  width: 100,
                  child: Image.asset('images/logo1.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 140, right: 100),
                child: Text(
                  'مركز المفقودين',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 290, right: 55),
                  child: Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2),
                          color: Colors.white),
                      child: TextField(
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        controller: _emailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.perm_identity),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'البريد الألكتروني ',
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ))),
              Padding(
                padding: EdgeInsets.only(top: 350, right: 55),
                child: Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2),
                        color: Colors.white),
                    child: TextField(
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      controller: _passwordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'كلمة المرور',
                          labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 410, right: 95),
                child: RaisedButton(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.white,
                  color: Color(0xFF155E98),
                  elevation: 10,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: () {

                    loginWithEmailAndPassword(_emailController.text.toString(),
                        _passwordController.text.toString());



                    // FirebaseAuth.instance.signInWithEmailAndPassword(
                    // email: _emailController.text, password: _passwordController.text).
                    // then((FirebaseUser user){
                    // Navigator.pushReplacement(context,
                    // MaterialPageRoute(builder: (context) => HomePage()));
                    // }).catchError((e){

                    //});
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 475, right: 90),
                child: Text(
                  'هل نسيت كلمة المرور؟',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 475, right: 275),
                  child: InkWell(
                    child: Text('نعم',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    onTap: () {},
                  )),
              Padding(
                padding: EdgeInsets.only(top: 510, left: 90, right: 70),
                child: Divider(color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 530, right: 70),
                child: Text(
                  'ليس لديك حساب؟',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 530, right: 200),
                  child: InkWell(
                    child: Text('انشاء حساب جديد',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(top: 590, right: 70),
                child: Text(
                  'أو تسجيل سريع',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 580, right: 200),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'f',
                        style: TextStyle(
                            color: Color(0xFF114976),
                            fontSize: 33,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 580, right: 265),
                  child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'G',
                          style: TextStyle(
                              color: Color(0xFF114976),
                              fontSize: 33,
                              fontWeight: FontWeight.bold),
                        ),
                      ))),
            ],
          )
        ],
      ),
    );
  }
}

class ClipImg extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
