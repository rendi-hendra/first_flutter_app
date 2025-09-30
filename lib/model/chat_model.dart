import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Chat {
  Chat({required this.name, this.message, this.notification = 1});

  @HiveField(0)
  String name;

  @HiveField(1)
  int? notification;

  @HiveField(2)
  String? message;

  // Chat({required this.name, this.notification = 0, this.message = ''});
}
