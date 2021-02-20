import 'package:fluttertoast/fluttertoast.dart';
import 'package:missing_center/Logic/business/Auth.dart';
import 'package:missing_center/Logic/data/model/userModel.dart';
import 'package:missing_center/ui/login.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();



   Future<String> createUser(String name, String phone,String email,String password) async {
    Users nUser = new Users.register(name, phone, email, password);

    UserAuth auth = new UserAuth();
    var response = await auth.createUsers(nUser);

    if(response != null) {
      if (response.statusCode == 200) {
        return "Done";
      }
      else {
        return "something wrong !!!";
      }
    }
    return "something wrong !!!";
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
                padding: EdgeInsets.only(top: 10, right: 150),
                child: Container(
                  height: 150,
                  width: 100,
                  child: Image.asset('images/logo1.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 140, right: 110),
                child: Text(
                  'مركز المفقودين',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 290, right: 50),
                  child: Container(
                      width: 303,
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
                        controller: _nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.perm_identity),
                            labelText: ' الأسم الكامل',
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ))),
              Padding(
                padding: EdgeInsets.only(top: 350, right: 50),
                child: Container(
                    width: 303,
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.mail),
                          labelText: 'البريد الألكتروني',
                          labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 410, right: 50),
                child: Container(
                    width: 303,
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
                      controller: _phoneController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'رقم الهاتف',
                          labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 470, right: 50),
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
                padding: EdgeInsets.only(top: 530, right: 95),
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
                  onPressed: regSubmit

                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 600, right: 115),
                child: Text(
                  'هل لديك حساب؟',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 600, right: 250),
                  child: InkWell(
                    child: Text('نعم',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  )),
            ],
          )
        ],
      ),
    );
  }

  void regSubmit() async {
    var replay = await createUser(
        _nameController.text.toString(), _phoneController.text.toString()
        , _emailController.text.toString(),
        _passwordController.text.toString());
    _nameController.text = "";
    _phoneController.text = "";
    _emailController.text = "";
    _passwordController.text = "";

    if (replay == "Done") {
      setState(() {
        Fluttertoast.showToast(
            msg: "OK",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      });
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

