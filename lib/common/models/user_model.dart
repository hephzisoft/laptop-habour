class UserModel {
  String? uid;
  String? username;
  String? email;
  String? avatar;

  UserModel({
    this.uid,
    this.username,
    this.email,
    this.avatar,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    
    return UserModel(
      uid: json['uid'],
      username: json['username'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}
