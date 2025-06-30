import '../../Domain/Entity/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.name
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
    );
  }
}