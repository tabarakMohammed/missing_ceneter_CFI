import 'dart:io';
class Missing{
  String name;
  int age;
  String gender;
  String phone;
  File image;
  String  detailMissing;
  String areaMissing;
  int  governorateId;


  Missing({
    this.name,
    this.age,
    this.gender,
    this.phone,
    this.image,
    this.detailMissing,
    this.areaMissing,
    this.governorateId
  });


  factory Missing.fromJson(Map<String, dynamic> parsedJson){

    return Missing(
        name: parsedJson['name'],
        age : parsedJson['age'],
        gender : parsedJson['gender'],
        phone : parsedJson['phone'],
        image : parsedJson['image'],
        detailMissing : parsedJson['detail_missing'],
        areaMissing : parsedJson['area_missing'],
        governorateId : parsedJson['governorate_id']
    );

  }


  Map<String, dynamic> toJson() => {

    "name": name,
    "age": age,
    "gender":gender,
    "phone": phone,
    "image": image,
    "detail_missing":detailMissing,
    "area_missing":areaMissing,
    "governorate_id":governorateId

  };



}