import 'package:flutter/material.dart';
import 'package:missing_center/Logic/business/homeMehtods.dart';
import 'package:missing_center/Logic/data/model/missingModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:convert';


class AddMissing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddMissingState();
  }
}

class _AddMissingState extends State<AddMissing> {
  TextEditingController _namemissingController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _detailsController = new TextEditingController();
  TextEditingController _placemissingController = new TextEditingController();

  var selectedcontery = '0';
  var selectedtype = '0';
  var selectedage = '0';

  ProgressDialog progressDialog;
  File _image;

  Future<String> addNewMissing(String name, int age, String gender, String phone,
   String  detailMissing, String areaMissing, int  governorateId,) async {

    MissingJob msj = new MissingJob();
    Missing newMissing = new Missing();
    newMissing.name = name;
    newMissing.age = age;
    newMissing.gender = gender;
    newMissing.image = _image;
    newMissing.phone = phone;
    newMissing.detailMissing = detailMissing;
    newMissing.areaMissing = areaMissing;
    newMissing.governorateId = governorateId;

    var response =  await msj.addMissingWithImage(newMissing);
    if(response != null) {
      if (response == 200) {
        return "Done";
      }
      else {
        return "something wrong !!!";
      }
    }
    return "something wrong !!!";
  }

  // Future<dynamic> readImage() async {
  //   var encryptedBase64EncodedString = await new File(_image.path).readAsStringSync(encoding:utf8);
  //   var decoded = base64.decode(encryptedBase64EncodedString);
  //   print(decoded);
  //   return decoded;
  // }


  Widget _owenImageView() {
    if(_image == null){
      return  Image.asset('images/code.jpg');
    } else {
     print(_image.readAsBytesSync());
      print(_image.path);
     return Image.file(_image);
    }
  }

  final picker = ImagePicker();
  Future getGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {

        print('No image selected.');

      }
      Navigator.pop(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    progressDialog = new ProgressDialog(context, type: ProgressDialogType.Normal);
    progressDialog.style(
    message: 'Please wait...',
    borderRadius: 10.0,
    backgroundColor: Colors.white,
    progressWidget: CircularProgressIndicator(),
    elevation: 10.0,
    insetAnimCurve: Curves.easeInOut,
    progressTextStyle: TextStyle(
    color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    messageTextStyle: TextStyle(
    color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF155E98),
        title: Text('اضافة مفقود',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: TextField(
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    controller: _namemissingController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'اكتب اسم المفقود ',
                        labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  )),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10, right: 25),
                    child: Container(
                      padding: EdgeInsets.only(right: 7),
                      width: 130,
                      height: 35,
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
                                'العمر',
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
                      padding: EdgeInsets.only(top: 10, right: 7),
                      child: Container(
                        padding: EdgeInsets.only(right: 7),
                        width: 90,
                        height: 35,
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
                                  'الجنس  ',
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
                  Padding(
                      padding: EdgeInsets.only(top: 10, right: 7),
                      child: Container(
                        padding: EdgeInsets.only(right: 7),
                        width: 130,
                        height: 35,
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
                                  'المحافظة      ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                            DropdownMenuItem(
                                value: '1',
                                child: Text('بغداد    ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            DropdownMenuItem(
                                value: '2',
                                child: Text('كربلاء    ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            DropdownMenuItem(
                                value: '3',
                                child: Text('    نجف',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            DropdownMenuItem(
                                value: '4',
                                child: Text('ميسان    ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            DropdownMenuItem(
                                value: '5',
                                child: Text('    بصرة',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            DropdownMenuItem(
                                value: '6',
                                child: Text('    واسط',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                            DropdownMenuItem(
                                value: '7',
                                child: Text('بابل    ',
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
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: TextField(
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    controller: _phoneController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'رقم الهاتف الخاص بك ',
                        labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: TextField(
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    controller: _detailsController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'تفاصيل عن المفقود ',
                        labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: TextField(
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    controller: _placemissingController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'مكان تواجد المفقود ',
                        labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  )),
              /*image == null ? Text('No image selected.') : Image.file(_image),**/
              Padding(
                padding: EdgeInsets.only(top: 20),

                child:
                      Column(
                      children: <Widget>[
                         _owenImageView()
                      ],
                      )




              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'ارفاق صورة',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  textColor: Color(0xFF155E98),
                  elevation: 10,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: _onAlertPress,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  padding: EdgeInsets.only(left: 55, right: 55),
                  child: Text(
                    'ارسال',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.white,
                  color: Color(0xFF155E98),
                  elevation: 10,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),

                  onPressed: submit,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

      void submit() async{

            String name = _namemissingController.text;
            int age  = int.parse(selectedage);
            String gender  = selectedtype;
            String phone   = _phoneController.text;
            String  detailMissing   = _detailsController.text;
            String areaMissing   = _namemissingController.text;
            int  governorateId   = int.parse(selectedcontery);

            var replay =  await addNewMissing(name,age,gender,phone,detailMissing,
                areaMissing,governorateId);
            if(replay == "Done") {

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


  Future<void> _onAlertPress() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/gallery.png',
                      width: 50,
                    ),
                    Text('الاستوديو'),
                  ],
                ),

                onPressed: getGalleryImage,
              ),
          ]);
        });
  }


}
