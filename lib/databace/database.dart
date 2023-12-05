import 'package:hive/hive.dart';

part 'database.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String? username;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? password;

  @HiveField(3)
  String? profession;

  @HiveField(4)
  String? dob;

  UserModel({
    this.username,
    this.email,
    this.password,
    this.dob,
    this.profession,
  });
}

void saveSignupDetails(
    [String? username,
    String? profession,
    String? dob,
    String? email,
    String? password]) async {}
