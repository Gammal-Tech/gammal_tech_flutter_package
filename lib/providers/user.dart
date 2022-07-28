import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String id;
  final String name;
  final String profilePictureUrl;
  final String bio;
  final String profession;
  List<Map<String, String>>? certificates;
  List<Map<String, String>>? experience;
  List<Map<String, String>>? exams;
  User(
      {required this.id,
      required this.name,
      required this.bio,
      required this.profilePictureUrl,
      required this.profession,
      this.certificates,
      this.experience,
      this.exams});
}
