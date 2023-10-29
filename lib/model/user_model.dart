class UserModel {
  final String name;
  final String homeTown;
  final String profilePic;
  final String createdAt;
  final String phoneNUmber;
  final String uid;

  UserModel(
      {required this.name,
      required this.homeTown,
      required this.profilePic,
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
}
