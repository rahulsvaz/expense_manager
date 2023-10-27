// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String phone;
  @HiveField(2)
  String age;
  @HiveField(3)
  String email;
  @HiveField(4)
  String imageUrl;
  User({
    required this.name,
    required this.phone,
    required this.age,
    required this.email,
    required this.imageUrl,
  });
}
