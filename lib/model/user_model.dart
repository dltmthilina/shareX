class UserModel {
  String name;
  String homeTown;
  String? profilePic;
  String createdAt;
  String phoneNUmber;
  String uid;
  String role;

  UserModel({
    required this.name,
    required this.homeTown,
    this.profilePic,
    required this.createdAt,
    required this.phoneNUmber,
    required this.uid,
    this.role = "user",
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] ?? '',
        homeTown: map['homeTown'] ?? '',
        profilePic: map['profilePic'] ?? '',
        createdAt: map['createdAt'] ?? '',
        phoneNUmber: map['phoneNUmber'] ?? '',
        uid: map['uid'] ?? '',
        role: "user");
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "homeTown": homeTown,
      "profilePic": profilePic,
      "phoneNumber": phoneNUmber,
      "createdAt": createdAt,
      "role": role,
    };
  }
}
