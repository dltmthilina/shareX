class UserModel {
  String name;
  String homeTown;
  String? profilePic;
  String createdAt;
  String phoneNUmber;
  String uid;

  UserModel(
      {required this.name,
      required this.homeTown,
      this.profilePic,
      required this.createdAt,
      required this.phoneNUmber,
      required this.uid});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] ?? '',
        homeTown: map['homeTown'] ?? '',
        profilePic: map['profilePic'] ?? '',
        createdAt: map['createdAt'] ?? '',
        phoneNUmber: map['phoneNUmber'] ?? '',
        uid: map['uid'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "homeTown": homeTown,
      "profilePic": profilePic,
      "phoneNumber": phoneNUmber,
      "createdAt": createdAt,
    };
  }
}
