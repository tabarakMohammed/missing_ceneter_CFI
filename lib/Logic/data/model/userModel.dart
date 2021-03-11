class Users{
  String name;
  String phone;
  String email;
  String password;
  dynamic image;
  String socialId;

  Users.register(this.name, this.phone, this.email,this.password)
  {this.image = "null";}

  Users.loginWithEmailAndPassword(this.email,this.password);

  Users.loginWithSocialMedia(this.name,this.email,this.socialId);

  Users.update(this.name, this.phone, this.email,this.image);

  Users({
    this.name,
    this.phone,
    this.email,
    this.image
  });

  factory Users.fromJson(Map<String, dynamic> parsedJson){

    return Users(
        name: parsedJson['name'],
        phone : parsedJson['phone'],
        email : parsedJson ['email'],
        image : parsedJson['image']
    );

  }


  Map<String, dynamic> toJson() => {


    "name": name,
    "phone": phone,
    "email": email,
    "password":password,
    "image": image,
    "social_id":socialId


  };


  Map<String, dynamic> logInToJson() => {
    // "name": name,
    // "phone": phone,
    "email": email,
    "password":password,
    // "image": image,
    // "social_id":socialId
  };



}