import 'package:flutter/material.dart';

class WhoWe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('من نحن',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          backgroundColor: Color(0xFF155E98),
          centerTitle: true,
        ),
        body: ListView(children: <Widget>[
          Stack(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 970,
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
                        height: 330,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 100),
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset('images/code.jpg'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 170, left: 30, right: 30),
              child: Text(
                'مبادرة مختصة في مجال البرمجة لتطوير المجتمع والتعليم المجاني وتوفير التطبيقات الخدمية مبادرة من الشعب الى الشعب',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 300, right: 125),
                child: Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2),
                  ),
                  child: Text(
                    'فريق العمل',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 350, right: 20),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/muhammed.jpg'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 330, right: 20),
                  child: Text('Muhammad Ali',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange)),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 400, right: 100),
                child: Text('Mohammedali.salim@codeforiraq.org',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            Padding(
              padding: EdgeInsets.only(top: 450, right: 30),
              child: Text('تصميم التطبيق',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 510, right: 30),
              child: Text('Sherin Ali',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 550, right: 30),
              child: Text('sherin.ali@codeforiraq.org',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 600, right: 30),
              child: Text('خوارزمية التطبيق',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 660, right: 30),
              child: Text('Halah Ali',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 700, right: 30),
              child: Text('hala.ali@codeforiraq.org',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 745, right: 30),
              child: Text('برمجة التطبيق',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 815, right: 20),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/tabarek.jpg'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 795, right: 20),
                  child: Text('تبارك محمد',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange)),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 870, right: 100),
                child: Text('tabarek.mohammed@codeforiraq.org',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            Padding(
              padding: EdgeInsets.only(top: 915, right: 30),
              child: Text('تحديث و تطوير',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1000, right: 160),
              child: Text('اتصل بنا',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1875BC))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1050, right: 90),
              child: Text('info@codeforiraq.org',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1090, right: 90),
              child: Text('www.codeforiraq.org',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
          ])
        ]));
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
