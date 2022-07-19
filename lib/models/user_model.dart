class UserModel {
  String? uid;
  String? fullName;
  String? phoneNo;
  String? email;

  UserModel({
    this.uid,
    this.email,
    this.fullName,
    this.phoneNo,
  });

  // receiving data from server
  factory UserModel.fromMap(Map<String, String> map) => UserModel(
        uid: map['uid'],
        email: map['email'],
        fullName: map['fullName'],
        phoneNo: map['phoneNo'],
      );

  // sending data to our server
  Map<String, dynamic> toMap() => {
        'uid': uid,
        'email': email,
        'fullName': fullName,
        'phoneNo': phoneNo,
      };
}
