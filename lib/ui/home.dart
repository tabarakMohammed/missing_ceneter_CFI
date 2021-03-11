import 'package:missing_center/Logic/business/Auth.dart';
import 'package:missing_center/Logic/business/homeMehtods.dart';
import 'package:missing_center/Logic/data/model/missingModel.dart';
import 'package:missing_center/ui/addmissing.dart';
import 'package:missing_center/ui/detailpage.dart';
import 'package:missing_center/ui/login.dart';
import 'package:missing_center/ui/whowe.dart';
import 'package:missing_center/ui/personfile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePgeState();
  }
}



class _HomePgeState extends State<HomePage> {
  TextEditingController _namemissingController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();

  var selectedage = '0';
  var selectedcontery = '0';
  var selectedtype = '0';


  UserAuth userAuth = new UserAuth();
  MissingJob ms = new MissingJob();
  List<Missing> dataList = new List<Missing>();
  Future<void> getMissing() async {
    ms.getAllMissing().then((value) =>
        setState(() {
      dataList = value;
      print("from set state" + dataList.length.toString());
    })
    );
  }

  Future<void> searchMissing(String missingName,String date, String ageSelected ,String conterySelected, String typeSelected)
   async {
     await  ms.getMissingBySearch
       (missingName,ageSelected ,typeSelected , date, conterySelected).then((value) =>
         setState(() {
           dataList = value;
         })

     );


     }

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    this.getMissing();
  }



  void _shwosearchsheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
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
              child: Column(children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                    child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1),
                            color: Colors.white),
                        child: TextField(
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          controller: _namemissingController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: '   اكتب اسم المفقود ',
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ))),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20, right: 60),
                      child: Container(
                        padding: EdgeInsets.only(right: 15),
                        width: 140,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1),
                            color: Colors.white),
                        child: DropdownButton<String>(
                          value: selectedage,
                          items: [
                            DropdownMenuItem(
                                value: '0',
                                child: Text(
                                  '  العمر',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                            DropdownMenuItem(
                                value: '1',
                                child: Text('0 ـ 1سنة',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            DropdownMenuItem(
                                value: '2',
                                child: Text('1_11 سنة',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            DropdownMenuItem(
                                value: '3',
                                child: Text('11_20 سنة',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            DropdownMenuItem(
                                value: '4',
                                child: Text('21_30 سنة',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            DropdownMenuItem(
                                value: '5',
                                child: Text('31_40 سنة',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            DropdownMenuItem(
                                value: '6',
                                child: Text('41_50 سنة',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            DropdownMenuItem(
                                value: '7',
                                child: Text('51  فما فوق',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                          ],
                          onChanged: (v) {
                            setState(() {
                              selectedage = v;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 20, right: 10),
                        child: Container(
                          padding: EdgeInsets.only(right: 20),
                          width: 140,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1),
                              color: Colors.white),
                          child: DropdownButton<String>(
                            value: selectedtype,
                            items: [
                              DropdownMenuItem(
                                  value: '0',
                                  child: Text(
                                    'الجنس          ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                              DropdownMenuItem(
                                  value: '1',
                                  child: Text('أنثى',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                              DropdownMenuItem(
                                  value: '2',
                                  child: Text('ذكر',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                            ],
                            onChanged: (v) {
                              setState(() {
                                selectedtype = v;
                              });
                            },
                          ),
                        )),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1),
                            color: Colors.white),
                        child: TextField(
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          controller: _dateController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: '      التاريخ     ',
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      padding: EdgeInsets.only(right: 20),
                      width: 295,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1),
                          color: Colors.white),
                      child: DropdownButton<String>(
                        value: selectedcontery,
                        items: [
                          DropdownMenuItem(
                              value: '0',
                              child: Text(
                                'المحافظة ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          DropdownMenuItem(
                              value: '1',
                              child: Text('بغداد',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '2',
                              child: Text('كربلاء',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '3',
                              child: Text('نجف',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '4',
                              child: Text('ميسان',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '5',
                              child: Text('بصرة',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '6',
                              child: Text('واسط',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '7',
                              child: Text('بابل',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '8',
                              child: Text('  صلاح الدين',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '9',
                              child: Text('    نينوى',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '10',
                              child: Text('    ديالى',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '11',
                              child: Text('    كركوك',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '12',
                              child: Text('قادسية    ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '13',
                              child: Text('    المثنى',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '14',
                              child: Text('الأنبار    ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '15',
                              child: Text('ذي قار    ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '16',
                              child: Text('دهوك    ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '17',
                              child: Text('   السليمانية',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                          DropdownMenuItem(
                              value: '18',
                              child: Text('     أربيل',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                        ],
                        onChanged: (v) {
                          setState(() {
                            selectedcontery = v;
                          });
                        },
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    color: Color(0xFF155E98),
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: Text(
                      'بحث',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    textColor: Colors.white,
                    elevation: 10,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    onPressed: ()  {
                        searchMissing(_namemissingController.text.toString()
                        ,_dateController.text.toString(),
                        selectedage,selectedcontery,selectedtype);
                        Navigator.pop(context);
                        }
                  ),
                ),
              ]));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          backgroundColor: Color(0xFF155E98),
          title: Text('المفقودين',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: _shwosearchsheet,
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [
                      const Color(0xFF114976),
                      const Color(0xFF155E98),
                    ],
                    center: Alignment.bottomCenter,
                    radius: 1,
                    tileMode: TileMode.clamp),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            padding: EdgeInsets.only(left: 100),
                            child: Text(
                              'المفقودين',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.people,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            padding: EdgeInsets.only(left: 80),
                            child: Text(
                              'اضافة مفقود',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              textDirection: TextDirection.rtl,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddMissing()));
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.person_add,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            padding: EdgeInsets.only(left: 60),
                            child: Text(
                              'الملف الشخصي',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              textDirection: TextDirection.rtl,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PersonFile()));
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            padding: EdgeInsets.only(left: 130),
                            child: Text(
                              'من نحن',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              textDirection: TextDirection.rtl,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WhoWe()));
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            padding: EdgeInsets.only(left: 90),
                            child: Text(
                              'تسجيل خروج',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              textDirection: TextDirection.rtl,
                            ),
                            onPressed: ()  {
                              userAuth.logOut()
                             // Navigator.pushAndRemoveUntil(context,
                             //     MaterialPageRoute(builder: (context) => LoginPage()), (
                             //         _) => false);
                              // FirebaseAuth.instance.signOut()
                              .then((value){
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute
                                      (builder: (context) => LoginPage()), (
                                        _) => false);
                              // Navigator.push(
                              // context,
                              // MaterialPageRoute(
                              // builder: (context) => LoginPage()));
                              }).catchError((e){

                              });
                            },
                          ),
                        ),

                        IconButton(
                          icon: Icon(
                            Icons.last_page,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 160),
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'images/logo2.png',
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 12),
                      child: Text(' Code for iraq 2019',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold))),
                ],
              )),
        ),
        body: Container(
          child:
            CustomScrollView(
              slivers: <Widget>[

                SliverGrid(
                  gridDelegate:
                  SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 0.7,
                  ),
                    // SliverGridDelegateWithFixedCrossAxisCount(
                    //  crossAxisCount: 2,
                    //   ),

                  delegate: SliverChildBuilderDelegate(

                        (BuildContext context, int index) {
                      return generalListView(dataList[index]);
                    },
                    childCount: dataList.length,
                  ),
                ),
               ],

            ),
    // ListView.builder(
          //   itemCount: dataList == null ? 1 : dataList.length,
          //   itemBuilder: (BuildContext context, int index) {
          //    if(index <= (dataList.length) ) {
          //       int fIndex = index + index ;
          //       int sIndex = fIndex + 1 ;
          //       print(fIndex.toString() + dataList[fIndex].name);
          //       print(sIndex.toString() + dataList[sIndex].name);
          //       var rightItem = dataList[fIndex];
          //       var leftItem = dataList[sIndex];
          //       return generalListView(rightItem, leftItem);
          //     } else {
          //
          //       return Text("Stop");
          //
          //     }
          //   }
          //),
        ),
    );
  }


  Widget generalListView(dataList){
    return Container(
       padding: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
          padding: EdgeInsets.only(right: 15, left: 15),
          child: Container(
            color: Colors.white,
            height: 280,
            width: 180,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: CircleAvatar(
                    radius: 50,
                    child:
                    Image.network(dataList.image.toString() != null ?
                        'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png'
                    :dataList.image.toString()),
                  ),
                ),
                Text(dataList.name),
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: RaisedButton(
                    child: Text(
                      "التفاصيل",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.only(top: 0),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    color: Color(0xFF155E98),
                    textColor: Colors.white,
                     onPressed: () =>
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => DetailPage(missing: dataList),
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

  // Widget generalListView(dataList, dataList2){
  //
  //   return Container(
  //     padding: EdgeInsets.only(top: 20),
  //     height: MediaQuery.of(context).size.height,
  //     width: MediaQuery.of(context).size.width,
  //     child: Column(
  //       children: <Widget>[
  //         Row(
  //           children: <Widget>[
  //             Padding(
  //               padding: EdgeInsets.only(right: 15),
  //               child: Container(
  //                 color: Colors.white,
  //                 height: 280,
  //                 width: 180,
  //                 child: Column(
  //                   children: <Widget>[
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 5),
  //                       child: CircleAvatar(
  //                         radius: 50,
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 125),
  //                       child: RaisedButton(
  //                         child: Text(
  //                           dataList.name,
  //                           style: TextStyle(
  //                               fontSize: 18, fontWeight: FontWeight.bold),
  //                         ),
  //                         padding: EdgeInsets.only(top: 0),
  //                         shape: new RoundedRectangleBorder(
  //                           borderRadius: new BorderRadius.circular(20.0),
  //                         ),
  //                         color: Color(0xFF155E98),
  //                         textColor: Colors.white,
  //                         onPressed: () => Navigator.push(
  //                             context,
  //                             MaterialPageRoute(
  //                                 builder: (context) => DetailPage())),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //
  //             Padding(
  //               padding: EdgeInsets.only(right: 20),
  //               child: Container(
  //                 color: Colors.white,
  //                 height: 280,
  //                 width: 180,
  //                 child: Column(
  //                   children: <Widget>[
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 5),
  //                       child: CircleAvatar(
  //                         radius: 50,
  //                       ),
  //
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 125),
  //                       child: RaisedButton(
  //                         child: Text(
  //                           dataList2.name,
  //                           style: TextStyle(
  //                               fontSize: 18, fontWeight: FontWeight.bold),
  //                         ),
  //                         padding: EdgeInsets.only(top: 0),
  //                         shape: new RoundedRectangleBorder(
  //                           borderRadius: new BorderRadius.circular(20.0),
  //                         ),
  //                         color: Color(0xFF155E98),
  //                         textColor: Colors.white,
  //                         onPressed: () => Navigator.push(
  //                             context,
  //                             MaterialPageRoute(
  //                                 builder: (context) => DetailPage())),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //
  //       ],
  //     ),
  //   );
  //
  // }



}



// class HomeList extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       padding: EdgeInsets.only(top: 20),
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(right: 15),
//                 child: Container(
//                   color: Colors.white,
//                   height: 280,
//                   width: 180,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(top: 5),
//                         child: CircleAvatar(
//                           radius: 50,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 125),
//                         child: RaisedButton(
//                           child: Text(
//                             'التفاصيل',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           padding: EdgeInsets.only(top: 0),
//                           shape: new RoundedRectangleBorder(
//                             borderRadius: new BorderRadius.circular(20.0),
//                           ),
//                           color: Color(0xFF155E98),
//                           textColor: Colors.white,
//                           onPressed: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => DetailPage())),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(right: 20),
//                 child: Container(
//                   color: Colors.white,
//                   height: 280,
//                   width: 180,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(top: 5),
//                         child: CircleAvatar(
//                           radius: 50,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 125),
//                         child: RaisedButton(
//                           child: Text(
//                             'التفاصيل',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           padding: EdgeInsets.only(top: 0),
//                           shape: new RoundedRectangleBorder(
//                             borderRadius: new BorderRadius.circular(20.0),
//                           ),
//                           color: Color(0xFF155E98),
//                           textColor: Colors.white,
//                           onPressed: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => DetailPage())),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(top: 15, right: 15),
//                 child: Container(
//                   color: Colors.white,
//                   height: 280,
//                   width: 180,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(top: 5),
//                         child: CircleAvatar(
//                           radius: 50,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 125),
//                         child: RaisedButton(
//                           child: Text(
//                             'التفاصيل',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           padding: EdgeInsets.only(top: 0),
//                           shape: new RoundedRectangleBorder(
//                             borderRadius: new BorderRadius.circular(20.0),
//                           ),
//                           color: Color(0xFF155E98),
//                           textColor: Colors.white,
//                           onPressed: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => DetailPage())),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 15, right: 20),
//                 child: Container(
//                   color: Colors.white,
//                   height: 280,
//                   width: 180,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(top: 5),
//                         child: CircleAvatar(
//                           radius: 50,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 125),
//                         child: RaisedButton(
//                           child: Text(
//                             'التفاصيل',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           padding: EdgeInsets.only(top: 0),
//                           shape: new RoundedRectangleBorder(
//                             borderRadius: new BorderRadius.circular(20.0),
//                           ),
//                           color: Color(0xFF155E98),
//                           textColor: Colors.white,
//                           onPressed: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => DetailPage())),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

//Hero(
//tag: ' Container',
//child: GestureDetector(
//onTap: () => Navigator.push(context,
//MaterialPageRoute(builder: (context) => DetailPage())),
//child: Container(
//width: 100,
//height: 100,
//color: Colors.teal,
//child: RaisedButton(
//padding: EdgeInsets.only(left: 40, right: 40),
//child: Text(
//'التفاصيل',
//style:
//TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//),
//textColor: Colors.white,
//color: Color(0xFF155E98),
//elevation: 10,
//shape: new RoundedRectangleBorder(
//borderRadius: new BorderRadius.circular(30.0),
//),
//onPressed: () {
//Navigator.push(
//context,
//MaterialPageRoute(
//builder: (context) => DetailPage()));
//},
//),
//),
//),
//),
