import 'package:hive/hive.dart';
part 'user_info.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String bio;
  @HiveField(2)
  String? imgUrl;
  @HiveField(3)
  String webSendUrl;
  UserModel(
      {required this.name,
      required this.imgUrl,
      required this.bio,
      required this.webSendUrl});
}
