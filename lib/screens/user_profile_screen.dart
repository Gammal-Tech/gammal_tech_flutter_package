import 'package:flutter/material.dart';
import '../screens/user_certificates_screen.dart';
import '../screens/user_exams_screen.dart';
import '../screens/user_experience_screen.dart';
import '../screens/user_info_screen.dart';

class UserProfileScreen extends StatelessWidget {
  Widget? screen1;
  Widget? screen2;
  Widget? screen3;
  Widget? screen4;
  String? title1;
  String? title2;
  String? title3;
  String? title4;
  final String id;

  UserProfileScreen({
    required this.id,
    this.screen1,
    this.screen2,
    this.screen3,
    this.screen4,
    this.title1,
    this.title2,
    this.title3,
    this.title4,
    Key? key,
  }) : super(key: key);
  static const routeName = '/user-profile-screen';

  @override
  Widget build(BuildContext context) {
    if (screen1 == null) {
      screen1 = UserInfoScreen(userId: id);
    }
    if (screen2 == null) {
      screen2 = CertificatesScreen(userId: id);
    }
    if (screen3 == null) {
      screen3 = ExperienceScreen(userId: id);
    }
    if (screen4 == null) {
      screen4 = ExamsScreen(userId: id);
    }
    if (title1 == null) {
      title1 = 'information';
    }
    if (title2 == null) {
      title2 = 'Certificates';
    }
    if (title3 == null) {
      title3 = 'Experience';
    }
    if (title4 == null) {
      title4 = 'verified Exams';
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
          bottom: TabBar(isScrollable: true, tabs: [
            Tab(
              icon: const Icon(Icons.account_circle_outlined, size: 15),
              text: title1,
              height: 50,
            ),
            Tab(
              icon: const Icon(Icons.beenhere_outlined, size: 15),
              height: 50,
              text: title2,
            ),
            Tab(
              icon: const Icon(Icons.star_border, size: 15),
              text: title3,
              height: 50,
            ),
            Tab(
              icon: const Icon(Icons.verified_outlined, size: 15),
              text: title4,
              height: 50,
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            screen1!,
            screen2!,
            screen3!,
            screen4!,
          ],
        ),
      ),
    );
  }
}
