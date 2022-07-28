import 'dart:convert';
import 'package:flutter/material.dart';
import './user.dart';
import 'package:http/http.dart' as http;

class Users with ChangeNotifier {
  List<User> _users = [];

  Future<void> fetchUsers() async {
    final url = Uri.parse(
        'https://new-project-64c39-default-rtdb.firebaseio.com/users.json');
    final response = await http.get(url);
    final usersData = json.decode(response.body) as Map<String, dynamic>;
    final List<User> loadedUsers = [];
    usersData.forEach((key, value) {
      loadedUsers.add(
        User(
          id: key,
          name: value['name'],
          bio: value['bio'],
          profilePictureUrl: value['profilePictureUrl'],
          profession: value['profession'],
          certificates: (value['certificates'] as List).map((e) {
            Map<String, String> temp = {
              'imageUrl': e['imageUrl'],
              'title': e['title']
            };

            return temp;
          }).toList(),
          experience: (value['experience'] as List).map((e) {
            Map<String, String> temp = {
              'imageUrl': e['imageUrl'],
              'title': e['title']
            };

            return temp;
          }).toList(),
          exams: (value['exams'] as List).map((e) {
            Map<String, String> temp = {
              'youtubeVideoAdress': e['youtubeVideoAdress'],
              'title': e['title']
            };

            return temp;
          }).toList(),
        ),
      );
      print(loadedUsers[0]);
      _users = loadedUsers;
      notifyListeners();
    });
  }

  List<User> get users {
    return _users;
  }

  User findById(userId) {
    return _users.firstWhere((user) => user.id == userId);
  }
}
